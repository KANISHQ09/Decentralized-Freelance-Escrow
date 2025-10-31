# Decentralized Freelance Escrow

## 📌 Project Description
The **Decentralized Freelance Escrow** smart contract ensures secure and transparent transactions between freelancers and clients. Funds are locked in the contract until both parties confirm project completion, preventing scams and ensuring trust.

## 🚀 Project Vision
To create a trustless freelance payment solution where clients and freelancers can work together securely without depending on centralized platforms.

## ⚙️ Key Features
- **Job Creation:** Clients can create and fund jobs.
- **Secure Escrow:** Funds remain locked until completion confirmation.
- **Payment Release:** Clients can release payment upon job approval.
- **Refund Option:** If work is not completed, clients can be refunded.
- **Full Transparency:** All job details and transactions are stored on-chain.

## 🔑 Core Smart Contract Functions
1. `createJob(address freelancer)`  
   Creates a new job and locks funds in the escrow.
2. `releasePayment(uint jobId)`  
   Releases payment to the freelancer when the client confirms.
3. `refundClient(uint jobId)`  
   Refunds the client if the job is canceled or incomplete.

## 🧭 Future Scope
- Add a **dispute resolution** mechanism with an arbitrator.
- Introduce **reputation scoring** for freelancers and clients.
- Build a **frontend UI** using Web3.js or React for easy interaction.

## 📜 Deployment Details
**Network:** Core Testnet  
**Contract Address:** `0xD4426da5A9E4124ef021224A8B3b9500F62cFcF1`  
**Transaction Hash:** `0xfb08e5b588f9c2dda77d29a05ae40e43f732bd93fdea14109e4a76535ea0c464`  

<img width="1917" height="860" alt="image" src="https://github.com/user-attachments/assets/87513eb0-cab8-4b26-9372-88439ed05b2d" />
