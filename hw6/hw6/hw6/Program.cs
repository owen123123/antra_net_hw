using System;
using System.Collections;
using System.Collections.Generic;

namespace hw6
{
    class Program
    {
        static void Main(string[] args)
        {

            int result = 10;
            //int[] numbers = GenerateNumbers(result);
            //Reverse(numbers);
            //PrintNumbers(numbers);

            Console.WriteLine( Fibonacci(100));
            //1, 1, 2, 3, 5, 8,

        }

        private static int Fibonacci(int res)
        {
            Dictionary<int, int> dict = new Dictionary<int, int>();
            dict.Add(1, 1);
            dict.Add(2, 1);

            if (res > 2)
            {
                for (int i = 3; i <= res; i++)
                {
                    dict.Add(i, dict[i - 1] + dict[i - 2]);
                }
            }

            //Hashtable table = new Hashtable();
            return dict[res];

        }

        private static void PrintNumbers(int[] num)
        {
            foreach (int n in num)
            {
                Console.WriteLine(n);
            }
        }
        private static void Reverse(int[] nums)
        {
            int left = 0, right = nums.Length - 1;
            while (left < right)
            {
                swap(left, right, nums);
                left++;
                right--;
            }
        }
         
        private static void swap(int left, int right, int[] nums)
        {
            int temp = nums[left];
            nums[left] = nums[right];
            nums[right] = temp;

        }
        private static int[] GenerateNumbers(int len)
        {
            int[] result = new int[len];
            for (int i = 0; i < len; i++)
            {
                result[i] = i;
            }
            return result;
        }
    }
}

//1.What are the six combinations of access modifier keywords and what do they do?

//    Public, Private, Protected, Internal, Protected Internal, Private Protected

//2. What is the difference between the static, const, and readonly keywords when applied 
//to a type member?
//    At first glance this sounds a lot like a const field, since a constant can only be given a value at its declaration and cannot have that value changed anywhere else. The difference lies in the details.

//    First, a const field is not a reference to anything; it is literal value "burned" into the code (using a const is the true definition of hard coding a value). A static readonly variable is a reference, 
//    and consequently a lookup is performed any time this variable is accessed. However, 
//    as often happens, the compiler is smarter than you and any supposed performance difference will probably be negated.

//3. What does a constructor do?
//    Constructors are used to initialize the fields of the new object instance.A constructor looks like a method except that it has no return data type (including void) and has the same name as the class
//    A constructor can have a parameter list and a class can have more than one constructor by varying the parameter list.

//4. Why is the partial keyword useful?\\
//    The partial keyword indicates that other parts of the class, struct, or interface can be defined in the namespace.All the parts must use the partial keyword.All the parts must be available at compile time to form the final type. ... \
//    If any part is declared abstract, then the whole type is considered abstract

//5. What is a tuple?
//    A tuple is a data structure that contains a sequence of elements of different data types.It can be used where you want to have a data structure to hold an object with properties, but you don't want to create a separate type for it.

//6. What does the C# record keyword do?\
//    You define a record by declaring a type with the record keyword, instead of the class or struct keyword. Optionally, you can declare a record class to clarify that it's a reference type. A record is a reference type and follows value-based equality semantics

//7. What does overloading and overriding mean?
//    Overloading occurs when two or more methods in one class have the same method name but different parameters.Overriding occurs when two methods have the same method name and parameters.One of the methods is in the parent class, and the other is in the child class.

//8. What is the difference between a field and a property?
//    Properties expose fields.Fields should (almost always) be kept private to a class and accessed via get and set properties.


//9. How do you make a method parameter optional?
//    --By using default value: 
//    --By using OptionalAttribute: 
//    --By Params Keyword: 
//10. What is an interface and how is it different from abstract class?

//    An abstract class permits you to make functionality that subclasses can implement or override whereas an interface only permits you to state functionality 
//    but not to implement it.A class can extend only one abstract class while a class can implement multiple interfaces.

//11.What accessibility level are members of an interface?
//    Interface members implicitly have public declared accessibility.

//12.True / False.Polymorphism allows derived classes to provide different implementations 
//of the same method.
//        true
//13. True/False. The override keyword is used to indicate that a method in a derived class is
//providing its own implementation of a method.
//    true
//14. True/False. The new keyword is used to indicate that a method in a derived class is
//providing its own implementation of a method.
//    false
//15. True/False. Abstract methods can be used in a normal (non-abstract) class. 
//    false
//16.True / False.Normal(non -abstract) methods can be used in an abstract class.
//    true
//17.True / False.Derived classes can override methods that were virtual in the base class.
//    true
//18.True / False.Derived classes can override methods that were abstract in the base class.
//    true
//19.True / False.In a derived class, you can override a method that was neither virtual non 
//abstract in the base class.
//    true
//20.True / False.A class that implements an interface does not have to provide an 
//implementation for all of the members of the interface. 
//    false
//21.True / False.A class that implements an interface is allowed to have other members that 
//aren’t defined in the interface. 
//    false
//22.True / False.A class can have more than one base class. 
//    false
//23.True / False.A class can implement more than one interface.
//    true
