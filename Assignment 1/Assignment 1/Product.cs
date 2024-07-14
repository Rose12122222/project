using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_1
{
    
    internal class Product
    {
        public event NotificationHandler handler;
        public int ProductID { get; }
        public double PurchasePrice { get; }
        public double SellingPrice { get; }
        public int Quantity { get; set; }

        public Product()
        {

        }

        public Product(int productId, double purchasePrice, double sellingPrice, int quantity)
        {
            ProductID = productId;
            PurchasePrice = purchasePrice;
            SellingPrice = sellingPrice;
            Quantity = quantity;
        }

        public override string ToString()
        {
            return $"ProductID: {ProductID}, Purchase Price: {PurchasePrice}, Selling Price: {SellingPrice}, Quantity: {Quantity}";
        }

        public void isProduct()
        {
            handler?.Invoke(this, new NotificationEventArgs("This is Product"));
        }
    }
}
