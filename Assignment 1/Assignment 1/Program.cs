namespace Assignment_1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Khởi tạo cửa hàng với một số sản phẩm
            ShopManager shop = new ShopManager(1000);
            shop.AddProduct(new Product(productId: 1, purchasePrice: 10, sellingPrice: 15, quantity: 50));
            shop.AddProduct(new Product(productId: 2, purchasePrice: 20, sellingPrice: 25, quantity: 5));
            shop.AddProduct(new Product(productId: 3, purchasePrice: 30, sellingPrice: 40, quantity: 10));
            shop.AddProduct(new Product(productId: 4, purchasePrice: 5, sellingPrice: 10, quantity: 1));

            Product p = new Product();

            ShopManager shop2 = new ShopManager(100);
            shop2.AddProduct(new Product(5, 150, 15, 5));

            // Đăng ký sự kiện
            shop.Notification += ShopNotification;
            shop2.Notification += ShopNotification;
           // NotificationHandler notificationHandler = new NotificationHandler(ShopNotification);

            p.handler += ShopNotification;

            // Kiểm tra các chức năng
            Console.WriteLine("Initial Products:");
            shop.ListProductsByQuantity(100);

            Console.WriteLine("\nSell Product 1 (10 units):");
            shop.SellProduct(1, 10);

            Console.WriteLine("\nBuy Product 2 (2 units):");
            shop.BuyProduct(2, 2);

            Console.WriteLine("\nList Products with Quantity <= 5:");
            shop.ListProductsByQuantity(5);

            Console.WriteLine("\nSell Product 4 (1 unit):");
            shop.SellProduct(4, 1);

            Console.WriteLine("\nSell Product 2 (10 units):");
            shop.SellProduct(2, 10);

            //kiểm tra chức năng shop 2
            Console.WriteLine("\nInitial Products of shop 2:");
            shop2.ListProductsByQuantity(10);

            Console.WriteLine("\nSell Product 5 (5 units):");
            shop2.SellProduct(5, 5);

            Console.WriteLine("\nBuy Product 5 (10 units):");
            shop2.BuyProduct(5, 10);

            Console.WriteLine("\nList Products with Quantity <= 10:");
            shop2.ListProductsByQuantity(10);

            Console.WriteLine("\n----------------");
            p.isProduct();

            Console.ReadLine();
        }

        public static void ShopNotification(object sender, NotificationEventArgs e)
        {
            Console.WriteLine(e);
        }
    }
}
