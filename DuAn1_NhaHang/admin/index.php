<?php 
    include_once "public/header.php";
    if(isset($_GET['pg'])&&($_GET['pg']!="")){
        switch ($_GET["pg"]) {
            case 'menu':
                include_once "public/menu.php";
                break;
            case 'about':
                include_once "public/about.php";
                break;
            case 'booking':
                include_once "public/booking.php";
                break;
            case 'contact':
                include_once "public/contact.php";
                break;
            case 'service':
                include_once "public/service.php";
                break;
            default:
            include_once "public/main.php";
                break;
        }
    }else {
        include_once "public/main.php";
    }
    include_once "public/footer.php";
?>