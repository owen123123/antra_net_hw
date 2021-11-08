using System;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

        }
    }
}

//1.Describe the problem generics address.
//    provide type safety

//2. How would you create a list of strings, using the generic List class?
//    List<Part> parts = new List<Part>();
//    parts.Add(new Part() { PartName = "crank arm", PartId = 1234 });
//    parts.Add(new Part() { PartName = "chain ring", PartId = 1334 });
//    parts.Add(new Part() { PartName = "regular seat", PartId = 1434 });
//    parts.Add(new Part() { PartName = "banana seat", PartId = 1444 });.
//3.How many generic type parameters does the Dictionary class have?
//     there are 17 type parameters,
//4.True / False.When a generic class has multiple type parameters, they must all match.
//    false
//5. What method is used to add items to a List object?
//     List.Add (), List.AddRange(), List.Insert(), and List.InsertRange()
//6. Name two methods that cause items to be removed from a List.
//    RemoveAt () method
//7. How do you indicate that a class has a generic type parameter?

//     Type parameter naming guidelines. See also. In a generic type or method definition, a type parameter is a placeholder for a specific type that a client specifies when they create an instance of the generic type.
//8. True/False. Generic classes can only have one generic type parameter.
//     false
//9. True/False. Generic type constraints limit what can be used for the generic type.
//     ture
//10. True/False. Constraints let you use the methods of the thing you are constraining to
//     true

