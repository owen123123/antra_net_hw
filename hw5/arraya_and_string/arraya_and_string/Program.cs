using System.Runtime;
using System;
using System.Collections;
using System.Linq;

namespace arraya_and_string
{
    class Program
    {
        static void Main(string[] args)
        {
            //int[] arr1 = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            //int[] arr2 = new int[arr1.Length];

            //for (int i = 0; i < arr1.Length; i++) {
            ////foreach (int i in arr1) { 
            //    arr2[i] = arr1[i];
            //    Console.WriteLine(arr2[i]);
            //}

            //addRemove();
            //int[] myArr = FindPrimesInRange(0, 10);
            //foreach (int i in myArr)
            //{
            //    Console.WriteLine(i);
            //}

            //int[] input = new int[] {3, 2, 4, -1 };
            //int steps = 2;
            //int[,] rst = new int[steps, input.Length - 1];
            //int[] rsts = new int[input.Length];
            //rsts = ArrayRotateSum(input, steps);

            //foreach (int i in rsts)
            //{
            //    Console.WriteLine(i);
            //}

            //int[] numbers = new[] { 0, 1, 1, 5, 2, 2, 6, 3, 3 };
            //int[] rst = longestSeq(numbers);

            //foreach (int i in rst)
            //{
            //    Console.WriteLine(i);
            //}

            //string str = "C# is not C++, and PHP is not Delphi!";
            //reverseString(str);

        }

        public static string reverseString(string str)
        {
            string result;
            int left = 0, right = str.Length;
            while (left < right)
            { 
                left++;
                right--;
            }

            return result;
        }

        public static int[] longestSeq(int[] numbers)
        {
            // Number of numbers in the current sequence
            int count = 1;
            // Number which is part of the longest sequence so faar
            int longestNum = numbers[0];
            // Number of numbers in the longest sequence we've seen so far
            int longestCount = 1;

            for (int i = 1; i < numbers.Length; i++)
            {
                // We're starting a new sequence
                if (numbers[i] != numbers[i - 1])
                {
                    count = 0;
                }

                count++;
                // Have we just found a new longest sequence?
                if (count > longestCount)
                {
                    longestCount = count;
                    longestNum = numbers[i];
                }
            }
            // longestNum = 1 and longestCount = 2 (because the longest sequence
            // had 2 1's in it). Turn this into the string "1 1".
            Console.WriteLine(
                string.Join(" ", Enumerable.Repeat(longestNum, longestCount)));

            // If you wanted to end up with an array containing [1, 1], then:
            int[] result = new int[longestCount];
            Array.Fill(result, longestNum);
            return result;

        }

        public static int[] ArrayRotateSum(int[] inputArray, int steps)
        {
            int[] result = new int[inputArray.Length];
            int[,] temp = new int[steps, inputArray.Length];
            for (int step = 1; step <= steps; step++)
            {
                for (int i = 0; i < inputArray.Length; i++)
                {
                    temp[step - 1, i] = inputArray[(i + step  + 1) % inputArray.Length];
                }

            }

            for (int i = 0; i < temp.GetLength(0); i++)
            {
                for (int k = 0; k < temp.GetLength(1); k++)
                {
                    result[k] += temp[i, k];
                }
             
            }
            return result;
            
        }


        public static int[] FindPrimesInRange(int startNum, int endNum)
        {
            var rst = new ArrayList();
            for (int i = startNum; i <= endNum; i++)
            {
                int count = 0;
                for (int j = 2; j <= Math.Sqrt(i); j++)
                {
                    if (i % j == 0)
                    { count++; break; }

                }
                if (count == 0 && i > 1)
                {
                    rst.Add(i);
                    Console.WriteLine("Prime Number -> {0}\n", i);
                }
            }

            int[] myArr = (int[])rst.ToArray(typeof(int));
            return myArr;

        }

        public static void addRemove()
        {
            Console.WriteLine("Enter command (+ item, - item, or -- to clear)):");

            var arr = new ArrayList();
            for (; ; )
            {
                string input = Console.ReadLine();
                string[] ele = input.Split(' ');
                if (ele[0] == "+")
                {
                    var temp = new ArrayList();
                    for (int i = 1; i < ele.Length; i++)
                    {
                        temp.Add(ele[i]);
                    }
                    arr.Add(temp);
                    foreach (var tt in arr)
                        Console.Write("   {0}", tt);
                    Console.WriteLine();
                    continue;
                }
                else if (ele[0] == "-")
                {
                    var temp = new ArrayList();
                    for (int i = 1; i < ele.Length; i++)
                    {
                        temp.Add(ele[i]);
                    }
                    if (arr.Contains(temp)) arr.Remove(temp);
                    foreach (var tt in arr)
                        Console.Write("   {0}", tt);
                    Console.WriteLine();
                    continue;
                }
                else if (ele[0] == "--")
                {
                    arr.Clear();
                    Console.WriteLine("all items are removed");
                    continue;
                }
            }
        }
    }
}

//1.When to use String vs. StringBuilder in C# ?
//    If you are using two or three string concatenations, use a string. StringBuilder will improve performance in cases where you make repeated modifications to a string or concatenate many strings together.

//2. What is the base class for all arrays in C#?
//    Provides methods for creating, manipulating, searching, and sorting arrays, thereby serving as the base class for all arrays in the common language runtime.

//3.How do you sort an array in C#?
//    The Array.Sort() method is used to sort an array in different ways

//4.What property of an array object can be used to get the total number of elements in an array?
//    Length Property is used to get the total number of elements in all the dimensions of the Array. 
//5. Can you store multiple data types in System.Array?
//    we cannot store multiple data types to array . we do this to arraylist not to array. array store homogenous types of data
//6. What’s the difference between the System.Array.CopyTo() and System.Array.Clone()
//    The Clone() method returns a new array(a shallow copy) object containing all the elements in the original array. 
//    The CopyTo() method copies the elements into another existing array. Both perform a shallow copy