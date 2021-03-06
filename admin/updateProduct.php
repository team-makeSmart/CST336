<?php 
     include 'dbConnection.php';
     
    if(isset($_GET['idplant'])) {
        $plant = getProductInfo();
    }
    
       function getProductInfo() {
        
        $conn = getDatabaseConnection();
        
        $sql = "SELECT * 
                FROM plant
                WHERE idplant=".$_GET['idplant'];
        
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $record = $stmt->fetch(PDO::FETCH_ASSOC);
        
        return $record;
    }
    

    if (isset($_GET['updateProduct'])) {
        
        if($_GET['imgLink']==null){
           $_GET['imgLink']="https://www.jainsusa.com/images/store/landscape/not-available.jpg";
        }
         
        $conn = getDatabaseConnection();
        
        $sql = "UPDATE plant
                SET plantName = :plantName,
                    plantDesc = :productDescription,
                    priceDollar = :priceDollar,
                    priceCent = :priceCent,
                    imgLink = :imgLink
               WHERE idplant = :idplant";
                
        $np = array();
        
        $np[":idplant"] = $_GET['idplant'];
        $np[":plantName"] = $_GET['plantName'];
        $np[":productDescription"] = $_GET['description'];
        $np[":priceDollar"] = $_GET['priceDollar'];
        $np[":priceCent"] = $_GET['priceCent'];
        
        $np[":imgLink"] = $_GET['imgLink'];

        $stmt = $conn->prepare($sql);
        $stmt->execute($np);
                
        header('Location:admin.php');
}
?>

<!DOCTYPE html>
<html>
    <head>
        <title> Update Product </title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    </head>
    <body>

        <div class='container'>
            <div class='well'>

                <h1> Update Product</h1>
                <form method="get" onsubmit="return confirmUpdate()">
                    <input type="hidden" name="idplant" value="<?=$plant['idplant']?>"/>
                    <strong> Product name </strong>
                    <input type="text" class="form-control" value="<?=$plant['plantName']?>" name="plantName"><br>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" rows="5" id="description" name="description"><?=$plant['plantDesc']?></textarea>
                    </div>
                    <strong>Price Dollar</strong><input type="text" class="form-control" name="priceDollar" value="<?=$plant['priceDollar']?>" ><br>
                    <strong>Price Cent</strong><input type="text" class="form-control" name="priceCent" value="<?=$plant['priceCent']?>" ><br>
                   
                    <strong>Set Image Url</strong><input type="text" name = "imgLink" class="form-control" value="<?=$plant['imgLink']?>"><br>
                    <input type="submit"  name="updateProduct"  class="btn btn-primary" value="Update Product">
                    
                </form>
            </div>
        </div>
         <script>
                function confirmUpdate() {
                    return confirm('Confirm Update');
                }
        </script>

    </body>
</html>