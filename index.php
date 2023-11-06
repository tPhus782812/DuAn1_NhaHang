<?php 
    include_once "view/header.php";
    if(isset($_GET['pg'])&&($_GET['pg']!="")){
        switch ($_GET["pg"]) {
            case 'menu':
                include_once "view/menu.php";
                break;
            case 'about':
                include_once "view/about.php";
                break;
            case 'booking':
                include_once "view/booking.php";
                break;
            case 'contact':
                include_once "view/contact.php";
                break;
            case 'service':
                include_once "view/service.php";
                break;
            default:
            include_once "view/home.php";
                break;
        }
    }else {
        include_once "view/home.php";
    }
    include_once "view/footer.php";
?>