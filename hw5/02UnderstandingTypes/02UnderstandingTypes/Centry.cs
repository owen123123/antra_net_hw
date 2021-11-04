using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _02UnderstandingTypes
{
    class Centry
    {
        public void CentryConvert(int cen)
        {
            Console.WriteLine($"{cen} centries = {cen * 100} years = {cen * 100 * 365} days = {cen * 100 * 365 * 24} hrs");
        }
    }
}
