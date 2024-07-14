using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_1
{
    public delegate void NotificationHandler(object sender, NotificationEventArgs e);
    public class NotificationEventArgs : EventArgs
    {
        public string message { get; set; }
        public NotificationEventArgs(string message)
        {
            this.message = message;
        }
        public override string ToString()
        {
            return message;
        }
    }
    internal class ShopManager
    {
        private Dictionary<int, Product> products;
        private double walletMoney;
        public event NotificationHandler Notification;

        public ShopManager(double initialWalletMoney)
        {
            products = new Dictionary<int, Product>();
            walletMoney = initialWalletMoney;
        }

        public void AddProduct(Product product)
        {
            products[product.ProductID] = product;
        }

        public void SellProduct(int productId, int k)
        {
            if (products.ContainsKey(productId) && products[productId].Quantity >= k)
            {
                double sellingPrice = products[productId].SellingPrice;
                walletMoney += k * sellingPrice;
                products[productId].Quantity -= k;
            }
            else
            {
                OnNotification("Not enough quantity to sell.");
            }
            CheckNotifications();
        }

        public void BuyProduct(int productId, int k)
        {
            if (products.ContainsKey(productId))
            {
                double purchasePrice = products[productId].PurchasePrice;
                if (walletMoney >= k * purchasePrice)
                {
                    walletMoney -= k * purchasePrice;
                    products[productId].Quantity += k;
                }
                else
                {
                    OnNotification("Not enough money to buy.");
                }
            }
            else
            {
                OnNotification("Product not found.");
            }
            CheckNotifications();
        }

        public void ListProductsByQuantity(int k)
        {
            var sortedProducts = products.Values.OrderByDescending(p => p.SellingPrice - p.PurchasePrice);
            foreach (var product in sortedProducts)
            {
                if (product.Quantity <= k)
                {
                    Console.WriteLine(product.ToString());
                }
            }
        }

        public void CheckNotifications()
        {
            if (products.Any(p => p.Value.Quantity < 5))
            {
                OnNotification("Some products have quantity less than 5.");
            }
            if (walletMoney < products.Min(p => p.Value.PurchasePrice))
            {
                OnNotification("Wallet almost run out of money.");
            }
            if (products.Any(p => p.Value.Quantity == 0))
            {
                OnNotification("Shop runs out of some products.");
            }
        }

        private void OnNotification(string message)
        {
            Notification?.Invoke(this, new NotificationEventArgs(message));
        }
    }
}
