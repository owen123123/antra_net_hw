using System;

namespace _02UnderstandingTypes
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("max value is {0}; min value is {1}.", int.MaxValue, int.MaxValue);
            Console.WriteLine("max value is {0}; min value is {1}.", sbyte.MaxValue, sbyte.MaxValue);
            Console.WriteLine("max value is {0}; min value is {1}.", byte.MaxValue, byte.MaxValue);
            Console.WriteLine("max value is {0}; min value is {1}.", short.MaxValue, short.MaxValue);
            Console.WriteLine("max value is {0}; min value is {1}.", ushort.MaxValue, ushort.MaxValue);

            Centry centry = new Centry();
            centry.CentryConvert(1);

            double a = 1.0;
            Console.WriteLine((int)a / 0);
        }
    }
}


//1.What type would you choose for the following “numbers”? 
//A person’s telephone number
//    string
//A person’s height
//    double
//A person’s age
//    int
//A person’s gender (Male, Female, Prefer Not To Answer)
//    enum
//A person’s salary 
//    double
//A book’s ISBN 
//    string
//A book’s price 
//    double
//A book’s shipping weight 
//    double
//A country’s population 
//    uint
//The number of stars in the universe 
//    ulong
//The number of employees in each of the small or medium businesses in the 
//United Kingdom (up to about 50,000 employees per business) 
//    uint
//2.What are the difference between value type and reference type variables? What is 
//boxing and unboxing?
//    While value types are stored generally in the stack, reference types are stored in the managed heap. ... In other words, variables or objects or value types have their own copy of the data. \
//    A reference type, meanwhile, extends System. Object and points to a location in the memory that contains the actual data
//    Boxing is the process of converting a value type to the type object or to any interface type implemented by this value type. ... Boxing is implicit; unboxing is explicit.

//3. What is meant by the terms managed resource and unmanaged resource in .NET
//    Managed resources are those that are pure . NET code and managed by the runtime and are under its direct control.Unmanaged resources are those that are not.File handles, pinned memory, \
//    COM objects, database connections etc

//4. Whats the purpose of Garbage Collector in .NET?
//    NET's garbage collector manages the allocation and release of memory for your application. Each time you create a new object, the common language runtime allocates memory for the object from the managed heap


