<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Merchant Home</title>
    <link rel="stylesheet" href="">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'poppins', sans-serif;
    }
    body{
        background: #020410;
    }
    .header {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        padding: 25px 12.5%;
        background: transparent;
        display: flex;
        justify-content: space-between;
        align-items: center;
        z-index: 100;
    }
    .navbar a {
        position: relative;
        font-size: 16px;
        color: #e4e4e4;
        text-decoration: none;
        font-weight: 500;
        margin-right: 30px;
    }
    .navbar a::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -6px;
        width: 100%;
        height: 2px;
        background: #e4e4e4;
        border-radius: 5px;
        transform: translateY(10px);
        opacity: 0;
        transition: .5s;
    }
    .navbar a:hover:after {
        transform: translateY(0);
        opacity: 10;
    }
    .search-bar{
        width: 250px;
        height: 40px;
        background: transparent;
        border: 2px solid #e4e4e4;
        border-radius: 6px;
        display: flex;
        align-items: center;
    }
    .search-bar input{
        width: 100%;
        background: transparent;
        border: none;
        outline: none;
        font-size: 16px;
        color: #e4e4e4;
        padding-left: 10px;
    }
    .search-bar input::placeholder{
        color: #e4e4e4;
    }
    .search-bar button{
        width: 40px;
        height: 100%;
        background: transparent;
        border: none;
        outline: none;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
    }
    .search-bar button i{
        font-size: 22px;
        color: #e4e4e4;
    }
    .background {
        width: 100%;
        height: 100vh;
        background: linear-gradient(rgba(74, 27, 27, 0.596), rgb(31, 59, 63), rgb(73, 33, 33)) ;
        background-size: cover;
        background-position: center;
        filter: blur(10px);
    }
    .container{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 80%;
        height: 600px;
        background: linear-gradient(rgba(74, 27, 27, 0.596), rgb(31, 59, 63), rgb(73, 33, 33)) ;
        background-size: cover;
        background-position: center;
        border-radius: 10px;
        margin-top: 20px;
    }
    .container .content {
        position: absolute;
        top: 0;
        left: 0;
        width: 58%;
        height: 100%;
        background: transparent;
        padding: 80px;
        color: #e4e4e4;
        display: flex;
        justify-content: space-between;
        flex-direction: column;
    }
    .content .logo{
        font-size: 30px;
    }
    .text-sci h2{
        font-size: 40px;
        line-height: 1;
    }
    .text-sci h2 span{
        font-size: 25px;
    }
    .text-sci p {
        font-size: 16px;
        margin: 20px 0;
    }
    .social-icons a i {
        font-size: 22px;
        color: #e4e4e4;
        margin-right: 10px;
        transition: .5s ease;
    }
    .social-icons a :hover{
        transform: scale(1.5);
    }
    .container .logreg-box{
        position: absolute;
        top: 0;
        right: 0;
        width: calc(100% - 40%);
        height: 100%;
    }
    .logreg-box .form-box {
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
        background: transparent;
        backdrop-filter: blur(20px);
        border-top-right-radius: 10px;
        border-bottom-left-radius: 10px;
        color: #e4e4e4;
    }
    .form-box h2 {
        font-size: 30px;
        text-align: center;
        color: rgb(186, 110, 95);
        padding: 25px;
       
    }
    .link{
        text-align: center;
        text-decoration: none;
        color: #e4e4e4;
        padding: 8px;
        border-radius: 10px;
    }
    .link:hover{
        background: rgb(139, 212, 139);
        color: #020410;
    }
</style>


</head>
<body>
    <header class="header">
        <nav class="navbar">
            <a href="Home_Page.html">Home</a>
            <a href="About.html">About</a>
           <a href="Contact_Page.jsp">Contact</a>
            <a href="Feedback_Page.jsp">Feedback</a>
        </nav>

        <form action="#" class="search-bar">
            <input type="text" placeholder="search...">
            <button class="submit"><i class='bx bx-search'></i></button>
        </form>
    </header>

    <div class="background"></div>

    <div class="container">
        <div class="content">
            <h2 class="logo"><i class='bx bxl-firebase'></i>SHOPPING HUBB</h2>
            <div class="text-sci"> 
                <h2>Welcome <br><span>To Our New Website.</span></h2>
                <p>"Shop with Ease, Anytime, Anywhere!" <br> <br>
					"Discover, Delight, and Shop Your Heart Out!" <br> <br>
					"Unlock a World of Shopping at Your Fingertips!"</p>
                   <div class="social-icons">
                    <a href="#"><i class='bx bxl-linkedin' ></i></a>
                    <a href="#"><i class='bx bxl-facebook' ></i></a>
                    <a href="#"><i class='bx bxl-instagram' ></i></a>
                    <a href="#"><i class='bx bxl-twitter' ></i></a>

                   </div>
            </div>
        </div>

        <div class="logreg-box">
            <div class="form-box login">
                <form action="saveadmin" method="post">
                    <h2>Merchant Option</h2>

                    <a href="AddProduct.html" class="link">Add Product</a><br><br>
				    <a href="ViewProduct.jsp"  class="link">View Product</a><br><br>
				    <a href="UpdateProduct.jsp"  class="link">Update Product</a><br><br>
				    <a href="DeleteProduct.jsp"  class="link">Delete Product</a><br><br>
				   
                </form>
            </div>
        </div>
    </div>

</body>
</html>