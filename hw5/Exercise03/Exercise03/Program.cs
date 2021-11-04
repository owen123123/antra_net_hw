using System;
using System.Collections;
using System.Globalization;

namespace Exercise03
{
    class Program
    {
        static void Main(string[] args)
        {

            CounTo24();
            //DateTime date1 = new DateTime(2021, 11, 03, 19, 00, 00, 00);
            //CultureInfo ci = CultureInfo.InvariantCulture;

            //Console.WriteLine(date1.ToString("hh:mm:ss.F", ci));          
            
            //printTriagle(5);


            //int guessNumbeer = int.Parse(Console.ReadLine());
            //int correctNumber = new Random().Next(3) + 1;

            //string rst = Guess(guessNumbeer, correctNumber);
            //Console.WriteLine(rst);

            //ArrayList fizz = FizzBuzz();

            //foreach (var item in fizz)
            //    Console.Write(item + ", ");

            //int max = 500;
            //for (byte i = 0; i < max; i++)
            //{
            //    WriteLine(i);
            //}
        }
         
        public static void CounTo24()
        {
            for (int i = 1; i < 5; i++)
            {
                for (int j = 0; j < 25; j++)
                {
                    if (j % i == 0)
                    {
                        Console.Write(" " + j + " ");
                    }
                }
                Console.WriteLine();
            }
        }
        public static void printTriagle(int n)
        {
            // outer loop to handle number of rows
            //  n in this case
            for (int i = 0; i < n; i++)
            {

                // inner loop to handle number spaces
                // values changing acc. to requirement
                for (int j = n - i; j > 1; j--)
                {
                    // printing spaces
                    Console.Write(" ");
                }

                //  inner loop to handle number of columns
                //  values changing acc. to outer loop
                for (int j = 0; j <= i; j++)
                {
                    // printing stars
                    Console.Write("* ");
                }

                // ending line after each row
                Console.WriteLine();
            }
        }

        public static string Guess(int gNum, int cNum)
        {
            while(true) { 
                if (gNum < 1 || gNum > 3) return "invalid guess";
                if (gNum == cNum)
                {
                    return "correct";
                } else if (gNum > cNum)
                {
                    return "too large";
                } else
                {
                    return "too small";
                }
            }
        }

        private static void WriteLine(byte i)
        {
            throw new NotImplementedException();
        }

        public static ArrayList FizzBuzz(int num = 100)
        {
            ArrayList arr = new ArrayList();
            for (int i = 0; i < num; i++)
            {
                if (i % 3 == 0 && i % 5 == 0)
                {
                    arr.Add($"/fizzbuzz/");
                }
                else if (i % 3 == 0)
                {
                    arr.Add($"/fizz/");
                }
                else if (i % 5 == 0)
                {
                    arr.Add($"/buzz/");
                }
                else
                {
                    arr.Add(i);
                }
            }
            return arr;
        }
    }

}


// 1.What happens when you divide an int variable by 0? 
//    System.DivideByZeroException: 'Attempted to divide by zero.'
//2. What happens when you divide a double variable by 0? 
//    infinit
//3. What happens when you overflow an int variable, that is, set it to a value beyond its 
//range? 
//    become negtive number
//4. What is the difference between x = y++; and x = ++y;?
//    ++y increments the value of y and then returns y
//    y++ returns the value of y and then increments
//5.What is the difference between break, continue, and return when used inside a loop 
//statement? 
//    As break terminates the remaining iteration of the loop and lets the control exits the loop. Here, continue works somewhat as a break.
//6. What are the three parts of a for statement and which of them are required? 
//    Code that declares and initialises the loop variable.
//    The loop's true/false condition.
//    And an expression that changes the loop variable after each loop cycle.
//    all of them are not required
//7. What is the difference between the = and == operators? 
//    = asign
//    == check value equality
//8. Does the following statement compile? for ( ; true; ) ;
//    yes
//9.What does the underscore _ represent in a switch expression? 
//    The underscore (_) character replaces the default keyword to signify that it should match anything if reached. The bodies are now expressions instead of statements. \
//    The selected body becomes the switch expression's result.
//10. What interface must an object implement to be enumerated over by using the foreach
//statement ?
//    The IEnumerable interface permits enumeration by using a foreach loop