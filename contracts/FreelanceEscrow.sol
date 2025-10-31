// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreelanceEscrow {
    struct Job {
        address client;
        address freelancer;
        uint amount;
        bool isCompleted;
        bool isPaid;
    }

    uint public jobCount;
    mapping(uint => Job) public jobs;

    event JobCreated(uint jobId, address client, address freelancer, uint amount);
    event PaymentReleased(uint jobId, address freelancer, uint amount);
    event RefundIssued(uint jobId, address client, uint amount);

    // Create a new freelance job
    function createJob(address _freelancer) external payable {
        require(msg.value > 0, "Job must have payment attached");
        jobCount++;
        jobs[jobCount] = Job(msg.sender, _freelancer, msg.value, false, false);
        emit JobCreated(jobCount, msg.sender, _freelancer, msg.value);
    }

    // Client releases payment when job is completed
    function releasePayment(uint _jobId) external {
        Job storage job = jobs[_jobId];
        require(msg.sender == job.client, "Only client can release payment");
        require(!job.isPaid, "Already paid");
        require(!job.isCompleted, "Job already completed");

        job.isCompleted = true;
        job.isPaid = true;

        payable(job.freelancer).transfer(job.amount);
        emit PaymentReleased(_jobId, job.freelancer, job.amount);
    }

    // Refund the client if job is not completed
    function refundClient(uint _jobId) external {
        Job storage job = jobs[_jobId];
        require(msg.sender == job.freelancer || msg.sender == job.client, "Unauthorized");
        require(!job.isPaid, "Already paid");
        require(!job.isCompleted, "Job already completed");

        job.isPaid = true;
        payable(job.client).transfer(job.amount);
        emit RefundIssued(_jobId, job.client, job.amount);
    }

    // View job details
    function getJobDetails(uint _jobId) public view returns (address, address, uint, bool, bool) {
        Job memory job = jobs[_jobId];
        return (job.client, job.freelancer, job.amount, job.isCompleted, job.isPaid);
    }
}
