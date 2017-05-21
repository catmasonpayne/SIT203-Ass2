//
//  AddToDataBaseCode.swift
//  BookCase DataBase 2
//
//  Created by Cat Mason-Payne on 15/05/2017.
//  Copyright © 2017 Deakin. All rights reserved.
//


// TO ADD THESE BOOKS TO THE DATABASE
/*
 Make the blank ViewController the initial ViewController.
 Run the app.
 Should be ready to go.
 
 */

import Foundation
import CoreData
import UIKit

class AddToDB : UIViewController {
    
    func addToDataBase () {
        // storing core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newBook = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
                newBook.setValue("The Sellout", forKey: "title")
                newBook.setValue("Paul Beatty", forKey: "author")
                newBook.setValue("Fiction", forKey: "genre")
                newBook.setValue("PaulBeatty-TheSellout", forKey: "image")
                newBook.setValue("9781786070173", forKey: "isbn")
                newBook.setValue("n/a", forKey: "movie")
                newBook.setValue("Oneworld", forKey: "publisher")
                newBook.setValue("4/5", forKey: "rating")
                newBook.setValue("n/a", forKey: "series")
                newBook.setValue("A biting satire about a young man's isolated upbringing and the race trial that sends him to the Supreme Court, it challenges the sacred tenets of the United States Constitution, urban life, the civil rights movement, the father-son relationship, and the holy grail of racial equality—the black Chinese restaurant.", forKey: "summary")
        
        
        
        let newBook1 = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBook1.setValue("Harry Potter and the Prisoner of Azkaban", forKey: "title")
        newBook1.setValue("JK Rowling", forKey: "author")
        newBook1.setValue("Fantasy", forKey: "genre")
        newBook1.setValue("prisonerofazkaban", forKey: "image")
        newBook1.setValue("0-7475-4215-5", forKey: "isbn")
        newBook1.setValue("May 2004", forKey: "movie")
        newBook1.setValue("Bloomsbury", forKey: "publisher")
        newBook1.setValue("3.8/5", forKey: "rating")
        newBook1.setValue("3 / 7", forKey: "series")
        newBook1.setValue("The book follows Harry Potter, a young wizard, in his third year at Hogwarts School of Witchcraft and Wizardry. Along with friends Ron Weasley and Hermione Granger, Harry investigates Sirius Black, an escaped prisoner from Azkaban who they believe is one of Lord Voldemort's old allies.", forKey: "summary")
        
        let newBook2 = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBook2.setValue("Harry Potter and the Goblet Of Fire", forKey: "title")
        newBook2.setValue("JK Rowling", forKey: "author")
        newBook2.setValue("Fantasy", forKey: "genre")
        newBook2.setValue("gobletoffire", forKey: "image")
        newBook2.setValue("0-7475-4624-X", forKey: "isbn")
        newBook2.setValue("November 2005", forKey: "movie")
        newBook2.setValue("Bloomsbury", forKey: "publisher")
        newBook2.setValue("4/5", forKey: "rating")
        newBook2.setValue("4 / 7", forKey: "series")
        newBook2.setValue("Harry Potter and the Goblet of Fire takes us deeper into the characters' minds and the darkness of the Wizarding World. At the Quidditch World Cup, Voldemort's followers gather and wreak havoc. Then, at Hogwarts, a legendary event takes place. The Triwizard Tournament!", forKey: "summary")
        
        let newBook3 = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBook3.setValue("Harry Potter and the Order of The Pheonix", forKey: "title")
        newBook3.setValue("JK Rowling", forKey: "author")
        newBook3.setValue("Fantasy", forKey: "genre")
        newBook3.setValue("orderofphoenix", forKey: "image")
        newBook3.setValue("0-7475-5100-6", forKey: "isbn")
        newBook3.setValue("July 2007", forKey: "movie")
        newBook3.setValue("Bloomsbury", forKey: "publisher")
        newBook3.setValue("4.2/5", forKey: "rating")
        newBook3.setValue("5 / 7", forKey: "series")
        newBook3.setValue("After returning to Hogwarts to begin his fifth year at Hogwarts, Harry Potter discovers that much of the wizarding world, including the Ministry of Magic, is in denial about Lord Voldemort's return.", forKey: "summary")
        
        let newBook4 = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBook4.setValue("Harry Potter and the Half Blood Prince", forKey: "title")
        newBook4.setValue("JK Rowling", forKey: "author")
        newBook4.setValue("Fantasy", forKey: "genre")
        newBook4.setValue("Harry_Potter_and_the_Half-Blood_Prince", forKey: "image")
        newBook4.setValue("0-7475-8108-8", forKey: "isbn")
        newBook4.setValue("July 2009", forKey: "movie")
        newBook4.setValue("Bloomsbury", forKey: "publisher")
        newBook4.setValue("4.5/5", forKey: "rating")
        newBook4.setValue("6 / 7", forKey: "series")
        newBook4.setValue("As Death Eaters wreak havoc in both Muggle and Wizard worlds, Hogwarts is no longer a safe haven for students. Though Harry suspects there are new dangers lurking within the castle walls, Dumbledore is more intent than ever on preparing the young wizard for the final battle with Voldemort. Meanwhile, teenage hormones run rampant through Hogwarts, presenting a different sort of danger. Love may be in the air, but tragedy looms, and Hogwarts may never be the same again.", forKey: "summary")
        
        let newBook5 = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBook5.setValue("Harry Potter and the Dealthy Hallows", forKey: "title")
        newBook5.setValue("JK Rowling", forKey: "author")
        newBook5.setValue("Fantasy", forKey: "genre")
        newBook5.setValue("deathlyhallows", forKey: "image")
        newBook5.setValue("0-545-01022-5", forKey: "isbn")
        newBook5.setValue("Part 1: November 2010, Part 2: July 2011", forKey: "movie")
        newBook5.setValue("Bloomsbury", forKey: "publisher")
        newBook5.setValue("4.8/5", forKey: "rating")
        newBook5.setValue("7 / 7", forKey: "series")
        newBook5.setValue("The Durselys are forced to go into hiding so that Voldemort's Death Eaters will not torture them for information, and Harry sets off with Ron and Hermione on a difficult quest to find and destroy the last of Voldemort's Horcruxes. Only once those have been destroyed, Harry knows, can Voldemort truly be killed.", forKey: "summary")
        
        let newBook6 = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBook6.setValue("All The Light We Cannot See", forKey: "title")
        newBook6.setValue("Anthony Doerr", forKey: "author")
        newBook6.setValue("Historical Fiction", forKey: "genre")
        newBook6.setValue("allthelight", forKey: "image")
        newBook6.setValue("97800007548699", forKey: "isbn")
        newBook6.setValue("n/a", forKey: "movie")
        newBook6.setValue("Harper Collins", forKey: "publisher")
        newBook6.setValue("4/5", forKey: "rating")
        newBook6.setValue("n/a", forKey: "series")
        newBook6.setValue("For Marie-Laure, blind since the age of six, the world is full of mazes. The miniature of a Paris neighbourhood, made by her father to teach her the way home. The microscopic layers within the invaluable diamond that her father guards in the Museum of Natural History. The walled city by the sea, where father and daughter take refuge when the Nazis invade Paris. And a future which draws her ever closer to Werner, a German orphan, destined to labour in the mines until a broken radio fills his life with possibility and brings him to the notice of the Hitler Youth.", forKey: "summary")
        
        let newBook7 = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBook7.setValue("The Book Theif", forKey: "title")
        newBook7.setValue("Markus Zusak", forKey: "author")
        newBook7.setValue("Historical Fiction", forKey: "genre")
        newBook7.setValue("bookthief", forKey: "image")
        newBook7.setValue("9781743515860", forKey: "isbn")
        newBook7.setValue("October 2013", forKey: "movie")
        newBook7.setValue("Pan Macmillan", forKey: "publisher")
        newBook7.setValue("4.8/5", forKey: "rating")
        newBook7.setValue("n/a", forKey: "series")
        newBook7.setValue("In 1938, young orphan Liesel arrives at the home of her new foster parents, Hans and Rosa. When Hans, a kindly housepainter, learns that Liesel cannot read, he teaches the child the wonders of the written language. Liesel grows to love books, even rescuing one from a Nazi bonfire. Though Liesel's new family barely scrape by, their situation becomes even more precarious when they secretly shelter a Jewish boy whose father once saved Hans' life.", forKey: "summary")
        
        let newBook8 = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBook8.setValue("The Girl On The Train", forKey: "title")
        newBook8.setValue("Paula Hawkins", forKey: "author")
        newBook8.setValue("Mystery/Crime", forKey: "genre")
        newBook8.setValue("girlonthetrain", forKey: "image")
        newBook8.setValue("9780552779777", forKey: "isbn")
        newBook8.setValue("November 2016", forKey: "movie")
        newBook8.setValue("Transworld", forKey: "publisher")
        newBook8.setValue("3/5", forKey: "rating")
        newBook8.setValue("n/a", forKey: "series")
        newBook8.setValue("Commuter Rachel Watson catches daily glimpses of a seemingly perfect couple, Scott and Megan, from the window of her train. One day, Watson witnesses something shocking unfold in the backyard of the strangers' home. Rachel tells the authorities what she thinks she saw after learning that Megan is now missing and feared dead. Unable to trust her own memory, the troubled woman begins her own investigation, while police suspect that Rachel may have crossed a dangerous line.", forKey: "summary")
        
        let newBook9 = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBook9.setValue("The Light Between Oceans", forKey: "title")
        newBook9.setValue("M. L. Stedman", forKey: "author")
        newBook9.setValue("Drama / Romance", forKey: "genre")
        newBook9.setValue("thelightbetweenoceans", forKey: "image")
        newBook9.setValue("9781742755717", forKey: "isbn")
        newBook9.setValue("September 2016", forKey: "movie")
        newBook9.setValue("Random House Australia", forKey: "publisher")
        newBook9.setValue("4/5", forKey: "rating")
        newBook9.setValue("n/a", forKey: "series")
        newBook9.setValue("Tom is a World War I veteran who maintains a lighthouse off the shore of Australia with his wife Isabel, a woman desperate to have a baby. Her prayers are answered when an infant washes up on shore in a rowboat. Tom thinks they should notify the authorities but ultimately gives in to Isabel's wish to keep the girl. Fate strikes again when the couple meet the child's biological mother on the mainland. Now, Tom and Isabel must make a decision that will forever affect the lives of four people.", forKey: "summary")
        
        let newBookA = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBookA.setValue("Burial Rites", forKey: "title")
        newBookA.setValue("Hannah Kent", forKey: "author")
        newBookA.setValue("Fiction", forKey: "genre")
        newBookA.setValue("burielrites", forKey: "image")
        newBookA.setValue("9781743516966", forKey: "isbn")
        newBookA.setValue("n/a", forKey: "movie")
        newBookA.setValue("Pan Macmillan", forKey: "publisher")
        newBookA.setValue("4/5", forKey: "rating")
        newBookA.setValue("n/a", forKey: "series")
        newBookA.setValue("Burial Rites tells the story of Agnes Magnúsdóttir, a servant in northern Iceland who was condemned to death after the murder of two men, one of whom was her employer, and became the last woman put to death in Iceland.", forKey: "summary")
        
        let newBookB = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBookB.setValue("Me Before You", forKey: "title")
        newBookB.setValue("Jojo Moyes", forKey: "author")
        newBookB.setValue("Romance", forKey: "genre")
        newBookB.setValue("mebeforeyou", forKey: "image")
        newBookB.setValue("9780718177027", forKey: "isbn")
        newBookB.setValue("June 2016", forKey: "movie")
        newBookB.setValue("Penguin Books", forKey: "publisher")
        newBookB.setValue("4/5", forKey: "rating")
        newBookB.setValue("n/a", forKey: "series")
        newBookB.setValue("Young and quirky Louisa Clark moves from one job to the next to help her family make ends meet. Her cheerful attitude is put to the test when she becomes a caregiver for Will Traynor, a wealthy young banker left paralyzed from an accident two years earlier. Will's cynical outlook starts to change when Louisa shows him that life is worth living. As their bond deepens, their lives and hearts change in ways neither one could have imagined.", forKey: "summary")
        
        let newBookC = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBookC.setValue("The Rosie Project", forKey: "title")
        newBookC.setValue("Graeme Simsion", forKey: "author")
        newBookC.setValue("Romance", forKey: "genre")
        newBookC.setValue("therosieproject", forKey: "image")
        newBookC.setValue("9781922147844", forKey: "isbn")
        newBookC.setValue("n/a", forKey: "movie")
        newBookC.setValue("Text Publishing", forKey: "publisher")
        newBookC.setValue("1/5", forKey: "rating")
        newBookC.setValue("n/a", forKey: "series")
        newBookC.setValue("The Rosie Project explores the romantic and comedic errors of a man with undiagnosed Asperger's Syndrome, Don Tillson, as he looks for a wife. As a professor of genetics, Don lives an orderly, predictable life in a protected academic setting.", forKey: "summary")
        
        let newBookD = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBookD.setValue("Jasper Jones", forKey: "title")
        newBookD.setValue("Craig Silvey", forKey: "author")
        newBookD.setValue("Drama / Mystery / Thriller", forKey: "genre")
        newBookD.setValue("jasperjones", forKey: "image")
        newBookD.setValue("9781760295929", forKey: "isbn")
        newBookD.setValue("March 2017", forKey: "movie")
        newBookD.setValue("Allen & Unwin", forKey: "publisher")
        newBookD.setValue("5/5", forKey: "rating")
        newBookD.setValue("n/a", forKey: "series")
        newBookD.setValue("Late on a hot summer night in the tail-end of 1965, Charlie Bucktin, a precocious and bookish boy of thirteen, is startled by an urgent knock on the window of his sleep-out. His visitor is Jasper Jones, an outcast in the regional mining town of Corrigan. Rebellious, mixed-race and solitary, Jasper is a distant figure of danger and intrigue for Charlie. So when Jasper begs for his help, Charlie eagerly steals into the night by his side, terribly afraid but desperate to impress. Jasper takes him through town and to his secret glade in the bush, and it's here that Charlie bears witness to Jasper's horrible discovery. With his secret like a brick in his belly, Charlie is pushed and pulled by a town closing in on itself in fear and suspicion as he locks horns with his tempestuous mother, falls nervously in love and battles to keep a lid on his zealous best friend, Jeffrey Lu.", forKey: "summary")
        
        let newBookE = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBookE.setValue("The Hobbit", forKey: "title")
        newBookE.setValue("J. R. R. Tolkien", forKey: "author")
        newBookE.setValue("Fantasy", forKey: "genre")
        newBookE.setValue("thehobbit", forKey: "image")
        newBookE.setValue("9780007487301", forKey: "isbn")
        newBookE.setValue("An Unexpected Journey (2012), The Desolation of Smaug (2013), The Battle of the Five Armies (2014).", forKey: "movie")
        newBookE.setValue("Harper Collins", forKey: "publisher")
        newBookE.setValue("3.8/5", forKey: "rating")
        newBookE.setValue("prequel", forKey: "series")
        newBookE.setValue("Bilbo Baggins is a hobbit who enjoys a comfortable, unambitious life, rarely travelling further than the pantry of his hobbit-hole in Bag End. But his contentment is disturbed when the wizard, Gandalf, and a company of 13 dwarves arrive on his doorstep one day to whisk him away on an unexpected journey 'there and back again'.", forKey: "summary")
        
        let newBookF = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBookF.setValue("The Lord of the Rings", forKey: "title")
        newBookF.setValue("J. R. R. Tolkien", forKey: "author")
        newBookF.setValue("Fantasy", forKey: "genre")
        newBookF.setValue("lordoftherings", forKey: "image")
        newBookF.setValue("9780261103252", forKey: "isbn")
        newBookF.setValue("The Fellowship of the Ring (2001), The Two Towers (2002), The Return of the King (2003)", forKey: "movie")
        newBookF.setValue("Harper Collins", forKey: "publisher")
        newBookF.setValue("5/5", forKey: "rating")
        newBookF.setValue("n/a", forKey: "series")
        newBookF.setValue("Sauron, the Dark Lord, has gathered to him the Rings of Power - the means by which he will be able to rule the world. All he lacks in his plan for dominion is the Ruling Ring, which has fallen into the hands of the hobbit Bilbo Baggins.", forKey: "summary")
        
        let newBookG = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        newBookG.setValue("The Messenger", forKey: "title")
        newBookG.setValue("Markus Zusak", forKey: "author")
        newBookG.setValue("Young Adult", forKey: "genre")
        newBookG.setValue("themessenger", forKey: "image")
        newBookG.setValue("9781742613598", forKey: "isbn")
        newBookG.setValue("n/a", forKey: "movie")
        newBookG.setValue("Pan Macmillan", forKey: "publisher")
        newBookG.setValue("4/5", forKey: "rating")
        newBookG.setValue("n/a", forKey: "series")
        newBookG.setValue("Meet Ed Kennedy - cab driving prodigy, pathetic card player and useless at sex. He lives in the suburbs, shares coffee with his dog, the Doorman, and he's in nervous-love with Audrey. His life is one of peaceful routine and incompetence - until he inadvertently stops a bank robbery. That's when the first ace turns up. That's when Ed becomes the messenger. Chosen to care, he makes his way through town, helping and hurting (where necessary) until only one question remains. Who's behind Ed's mission? The Messenger, by the highly acclaimed author Markus Zusak, is a cryptic journey filled with laughter, fists and love.", forKey: "summary")
        
        
        do
        {
            try context.save()
            print("SAVE")
        }
        catch
        {
            // print
        }


    }
}
