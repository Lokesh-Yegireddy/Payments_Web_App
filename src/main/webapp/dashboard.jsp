<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
    }

    .navbar-container {
        display: flex;
        flex-direction: column;
        background-color: #007acc;
        color: white;
        padding: 10px 20px;
    }

    .logo {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        padding-bottom: 5px;
    }

    .navbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .welcome-message {
        font-size: 18px;
    }

    .logout {
        text-decoration: none;
        color: white;
        background-color: #ff4d4d;
        padding: 8px 15px;
        border-radius: 5px;
        font-weight: bold;
        transition: 0.3s ease-in-out;
    }

    .logout:hover {
        background-color: #cc0000;
    }
    
   /* Account Details Section */
.account-details {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: white;
    padding: 20px 30px;
    margin: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

/* Account Information */
.account-info {
    font-size: 18px;
    line-height: 1.6;
}

/* Increment Button */
.increment-btn {
    background-color: #28a745;
    color: white;
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-left: 10px;
}

.increment-btn:hover {
    background-color: #218838;
}

/* Send Money Button */
.send-money-btn {
    background-color: #ff9800;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.send-money-btn:hover {
    background-color: #e68900;
}

/*banks section*/
.bank-accounts {
    display: flex;
    justify-content: space-between;
    gap: 20px;
    margin-top: 20px;
    flex-wrap: wrap;
}

.card {
    width: 23%;
    padding: 20px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: left;
    transition: transform 0.3s ease-in-out;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.card h3 {
    margin-bottom: 10px;
    color: #007acc;
    text-align: center;
}

.card p {
    font-size: 14px;
    color: #333;
    margin-bottom: 5px;
}

.add-bank {
    background: #f8f8f8;
    border: 2px dashed #007acc;
    text-align: center;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
}

.add-bank:hover {
    background: #e0f5ff;
}

/*edit button in cards*/

.edit-btn {
    background: #007acc;
    color: white;
    border: none;
    padding: 8px 12px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    font-weight: bold;
    width: 100%;
    margin-top: 10px;
    transition: 0.3s ease-in-out;
}

.edit-btn:hover {
    background: #005fa3;
    box-shadow: 0px 4px 10px rgba(0, 122, 204, 0.5);
}

/* Transaction Section Styling */
.transaction-section {
    background: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    margin: 20px 0;
}

.transaction-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.search-box {
    padding: 10px;
    border: 1px solid #007acc;
    border-radius: 5px;
    font-size: 16px;
    width: 250px;
    background-color: rgba(255, 255, 255, 0.9);
}

.filter-dropdown {
    padding: 10px;
    border: 1px solid #007acc;
    border-radius: 5px;
    font-size: 16px;
    background-color: rgba(255, 255, 255, 0.9);
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}

.filter-dropdown:hover {
    border-color: #ff9800;
    box-shadow: 0px 0px 10px rgba(255, 152, 0, 0.7);
}

.download-btn {
    padding: 10px 15px;
    background: #ff9800;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: all 0.3s ease-in-out;
}

.download-btn:hover {
    background: #e68900;
    box-shadow: 0px 4px 10px rgba(255, 152, 0, 0.6);
}

.transaction-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

.transaction-table th, .transaction-table td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.transaction-table th {
    background: #007acc;
    color: white;
}

.transaction-table tr:nth-child(even) {
    background: #f2f2f2;
}

.pagination {
    display: flex;
    justify-content: center;
    margin-top: 15px;
}

.pagination button {
    padding: 8px 12px;
    margin: 5px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    background: #007acc;
    color: white;
    font-weight: bold;
    transition: all 0.3s ease-in-out;
}

.pagination button:hover {
    background: #005f99;
}

 
</style>
</head>
<body>

<div class="navbar-container">
    <div class="logo">Payments Web App</div>
    <nav class="navbar">
        <div class="welcome-message">
            Welcome, <span id="username">Lokesh Yegireddy</span>! 🎉
        </div>
        <div>
            <a href="LogoutServlet" class="logout">Logout</a>
        </div>
    </nav>
</div>
<!-- Account Details Section -->
<div class="account-details">
    <div class="account-info">
        <p><strong>Account Number:</strong> 123456789</p>
        <p><strong>Account Balance:</strong> ₹10,000</p>
        <p><strong>Wallet Balance:</strong> ₹2,000 <button class="increment-btn">+</button></p>
    </div>

    <button class="send-money-btn">Send Money</button>
</div>
<!-- Bank Accounts Section -->
<div class="bank-accounts">
    <!-- Bank Account 1 -->
    <div class="card">
        <h3>HDFC Bank</h3>
        <p><strong>Account Number:</strong> 1234 **** **** 5678</p>
        <p><strong>IFSC Code:</strong> HDFC0001234</p>
        <p><strong>Branch:</strong> MG Road, Bangalore</p>
        <p><strong>Balance:</strong> ₹75,000</p>
        <p><strong>Type:</strong> Savings</p>
         <button class="edit-btn">Edit</button>
    </div>
    
    <!-- Bank Account 2 -->
    <div class="card">
        <h3>ICICI Bank</h3>
        <p><strong>Account Number:</strong> 9876 **** **** 5432</p>
        <p><strong>IFSC Code:</strong> ICIC0005678</p>
        <p><strong>Branch:</strong> Connaught Place, Delhi</p>
        <p><strong>Balance:</strong> ₹1,20,500</p>
        <p><strong>Type:</strong> Current</p>
         <button class="edit-btn">Edit</button>
    </div>
    
    <!-- Bank Account 3 -->
    <div class="card">
        <h3>SBI Bank</h3>
        <p><strong>Account Number:</strong> 4567 **** **** 8901</p>
        <p><strong>IFSC Code:</strong> SBIN0003456</p>
        <p><strong>Branch:</strong> Bandra, Mumbai</p>
        <p><strong>Balance:</strong> ₹30,750</p>
        <p><strong>Type:</strong> Savings</p>
         <button class="edit-btn">Edit</button>
    </div>
    
    <!-- Add Bank Account -->
    <div class="card add-bank">
        <h3>+ Add Bank Account</h3>
    </div>
</div>

<!-- Transaction Data Section -->
<div class="transaction-section">
    <h2>Recent Transactions</h2>
    
    <!-- Search and Filter Options -->
    <div class="transaction-controls">
        <input type="text" id="searchBox" placeholder="🔍 Search transactions...">
        <select id="filterType">
            <option value="all">All Transactions</option>
            <option value="credit">Only Credits</option>
            <option value="debit">Only Debits</option>
        </select>
        <button id="downloadBtn">📥 Download</button>
    </div>
    
    <!-- Transaction Table -->
    <table class="transaction-table">
        <thead>
            <tr>
                <th>Transaction ID</th>
                <th>Date & Time</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>#TXN12345</td>
                <td>2024-03-12 10:30 AM</td>
                <td class="credit">Credit</td>
                <td>₹5,000</td>
                <td class="success">✅ Success</td>
                <td>Salary Credit</td>
            </tr>
            <tr>
                <td>#TXN67890</td>
                <td>2024-03-11 4:15 PM</td>
                <td class="debit">Debit</td>
                <td>₹1,200</td>
                <td class="failed">❌ Failed</td>
                <td>Amazon Purchase</td>
            </tr>
        </tbody>
    </table>
    
    <!-- Pagination -->
    <div class="pagination">
        <button class="prev">⬅️ Previous</button>
        <span>Page 1 of 5</span>
        <button class="next">Next ➡️</button>
    </div>
</div>



</body>
</html>
