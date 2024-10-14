## How Flutter App Become Active

1. main() function gets executed automatically -> By Dart, when executing the compiled app on the target device
2. runApp() should be called inside of main() -> runApp() "tells" Flutter what to display n the screen 
3. Pass the to-be-displayed "widget tree" to runApp() -> A "widget tree" is a combination of (nested) Flutter widgets that build the overall user interface  
  

MaterialApp :  Root app that's required by most other widgets  
Scaffold: Screen layout widgt that adds base styling & more  
Row: Widget that displays multiple adjacent child widgets  

Dart is an object-orianted language, all values are objects. And for more complex values like widgets or configuration objects or anything, you use classed as blueprints to basically tell Dart how these objects should then be created and which kind of data and logic. So functions should belong to the object that will be created.  

const helps Dart optimize runtime performance

![alt text](images/image-1.png)
![alt text](images/image-2.png)
![alt text](images/image-3.png)  

I'd like to have it on the entire screen instead.

![alt text](images/image-4.png)  
![alt text](images/image-5.png)  

Now this indeed does take up the entire screen.

![alt text](images/image-6.png)  
![alt text](images/image-7.png) 
![alt text](images/image-8.png) 

## Adding Icons to Buttons
Flutter gives you the Icon widget which can also be used outside of that icon button. Icon is a regular widget provided by Flutter and you can use it anywhere else where widgets can be used.

![alt text](images/image-9.png) 
![alt text](images/image-10.png) 

## Adding Transparency to Widgets

![alt text](images/image-11.png)   
![alt text](images/image-12.png)  

This can be useful, but behind the scenes, this is quite performance intensive. Not a huge problem for this basic app here but typically you should avoid using opacity if you can avoid it.  

![alt text](images/image-13.png)   
![alt text](images/image-14.png)  

## Adding a Stateful Widget

![alt text](images/image-15.png)   
![alt text](images/image-16.png)  
![alt text](images/image-17.png)   
![alt text](images/image-18.png)  
![alt text](images/image-19.png)  

You should have the same output as before, but now the app is prepared, such that we can start working on that button.

## Rendering Content Conditionally 

![alt text](images/image-20.png)  

## Accepting & Passing Functions as Values

StartScreen --> Welcome user + provides "Start Quiz" button  
Change state that controls which screen is visible  
  

QuestionScreen --> Walks user through questions + lets user pick answers  
Depends on "which screen is visible?" state

Problem: Two widgets neet to use the same state  
the solution here is to lift the state up, which is why we aldready created that quiz widget. If we menage our state in that quiz widget an we then also have the function for manipulating the state in there we can convineintly move between two different widgets by rendering content conditionally.

![alt text](images/image-21.png)  

Quiz here is, it's the parent widget of both screen and question screen. But it's not enough to just manage the state here, but instead you also must make sure that the child widget taht should initiate the state change, in this case, the start screen widget, get access to the state changing function defined in this parent widget. So in this case, start screen need to get access to this switch screen function.

![alt text](images/image-22.png)  
  

![alt text](images/image-23.png)  

![alt text](images/image-24.png)   
we need to manage the state in that widget, that Quiz widget that is in the end a parent widget of both StartScreen and QuestionScreen, because those widgets are used inside of Quiz widget, but at the moment we are getting an error.  
Now this error is related to me having const here. But even if that's removed, we still get an error.

## The "initState" Method

![alt text](images/image-25.png)  

We're getting this error here because I am using switchScreen here when initializing this activeScreen variable.  
  
SomeObject() -- Class initialization code  
SomeObject constructor function executes -- Instance variables & methods are created  
SomeObject was created & is stored in memory  
Flutter calls initState() -- Can be used for further initilization tasks  

![alt text](images/image-26.png) 
  
initState is just called immediately after the object was created, but technically not during the object creation, which is why technically activeScreen initially is null, which is why you must add this question mark here. 

![alt text](images/image-27.png)   
![alt text](images/image-28.png)  

we see this initial start screen, which proves that setting activeScreen to StartScreen here worked because it is activeScreen that is then used down. And if this would be null still we wouldn't see anything. So the fact that we see something here proves that it works. And if click star screen, we switch to the question screen.

![alt text](images/image-29.png) 

This screen only has some dummy content right now which is why it looks so broken and ugly but actually worked  

## Flutter's (Stateful) Widget Lifecycle

Every Flutter Widget has a built-in lifecycle: A collection of methods that are automatically executed by Flutter (at certain points of time).

There are three extremely important (stateful) widget lifecycle methods:

initState(): Executed by Flutter when the StatefulWidget's State object is initialized  
build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called  
dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)

## Using Ternary Expressions & Comparison Operators

![alt text](images/image-30.png)  
![alt text](images/image-31.png) 
![alt text](images/image-32.png) 
This approch has the advantage that it requires a bit less code. Most importatntly, it does not require this extra initState function.

## Understanding "if" Statements

![alt text](images/image-33.png) 

You could do that, but with that you would, still be using ternary expression.

![alt text](images/image-34.png) 

## Using "if" Statements In Lists

in Dart, you may also use if inside of lists to conditionally add items to lists:

```
final myList = [
  1,
  2,
  if (condition)
    3
];
```

In this example, the number 3 will only be added to myList if condition was met (condition can be true or false or a check that yields true or false - e.g., day == 'Sunday').

Please note that there are NO curly braces around the if statement body. The if statement body also only comprises the next line of code (i.e., you can't have multiple lines of code inside the if statement).

You can also specify an else case - an alternative value that may be inserted into the list if condition is not met:

```
final myList = [
  1,
  2,
  if (condition)
    3
  else
    4
];
```

Using this feature is optional. Alternatively, you could, for example, also work with a ternary expression:

```
final myList = [
  1,
  2,
  condition ? 3 : 4
];
```
Especially when inserting more complex values (e.g., a widget with multiple parameters being set) into a more complex list (e.g., a list of widgets passed to a Column() or Row()), this feature can lead to more readable code.


## if Statements & Statements in List

When using if statements - no matter if inside or outside of functions - as well as when using ternary expressions, you ultimately must provide a boolean value (true / false):
```
if (true) {
  // do something ...
}
// or
true ? 'this' : 'that'
```

Of course, hardcoding true or false into the code makes no sense though - you wouldn't need an if statement or ternary expression if a value would always be true or always be false.

Instead, true or false is typically derived by comparing values - e.g, comparing a number to an expected value:

```
if (randomNumber == 5) {
  // do something
}
```

The == operator checks for value equality (i.e., the values on the left and right side of the operator must be equal). It must not be mistaken with the assignment operator (which uses a single equal sign: =).

The assignment operator is used to assign values to variables:

```
var userName = 'Max'; // assignment operator used
if (userName == 'Max') { ... } // comparison operator used
```

Besides the equality operator (==) Dart also supports many other key comparison operators:

'!=' to check for inequality (randomNumber != 5 expects randomNumber to NOT be 5, i.e., to be any other value)

'>' to check for the value on the left to be greater than the value on the right (randomNumber > 5 yields true if randomNumber is greater than 5)

'>=' to check for the value on the left to be greater than or equal to the value on the right (randomNumber >= 5 yields true if randomNumber is greater than 5 or equals 5)

'<' to check for the value on the left to be smaller than the value on the right (randomNumber < 5 yields true if randomNumber is smaller than 5)

'<=' to check for the value on the left to be smaller than or equal to the value on the right (randomNumber <= 5 yields true if randomNumber is smaller than 5 or equals 5)

## Adding a Data Model & Dummy Data

The goal now in the end is to output a question and then a couple of possible answers for this question one answer will be right and after the user chose an answer that answer must be stored somewhere so that it can be considered for deriving final results screen. But immediately after picking an answer, the next question in line should be shown with its answers until there are no more quesstions and answers left.  
So therefore we need two main things here. We need some widgets here to display the question and the answers, but we also need the questions.  
In the lib foler I actually want to add a new code file because I wanna define a class that acts as a blueprint for my question objects, because I wanna st up questions as objects that group the question and the possible answer together into one data structure.

![alt text](images/image-35.png) 
![alt text](images/image-36.png) 

## Configuring a Column

![alt text](images/image-37.png) 

![alt text](images/image-38.png) 
![alt text](images/image-39.png) 

That's not the final look I want to have. Instead, I wanna make sure that we take the full available width here for the column.

![alt text](images/image-40.png) 
![alt text](images/image-41.png) 

## Creating a Reusable, Custom Styled Button

![alt text](images/image-42.png) 
![alt text](images/image-43.png) 
![alt text](images/image-44.png) 

## Accessing List Elements & Object Properties

![alt text](images/image-45.png)   
![alt text](images/image-46.png) 

with this solution, I manually created all these answer buttons, which is a lot of unnecessary code duplication.

## Mapping Lists & Using the Spread Operator

The goal now is to generate these answer buttons dynamically based on the actual amount of answers that we have for the current question.

![alt text](images/image-47.png)   
a List inside a List  
![alt text](images/image-48.png)   
children is a list of widgets, like text and size box, but also a list that containns other lists as values. And simply not what children wants. It wants just widgets as values inside this list, not other lists. So converting our answers to answer buttons is not enough if they are still in a list thereafter. Instead, what we have to do here is something called spreading. We have to spread this or this iterable, which is generated my map, into a couple of individual values. And taht's done myy adding three dots in front of that. Which is built- in operator.  
There three dots will simply take all the values in a list or an iterable and pull them out of the list, pull them out of the iterable, and instead place them as comma-separated values in this place in code here.

![alt text](images/image-49.png)   
Now these answer buttons in the list of answer buttons here are pulled out, and added as individual comma-separated answer buttons to this list here, which is set as a value children.  
So that overall here we get a list of widgets.

![alt text](images/image-50.png)  
We have all these answers like before, but now they're dynamically generated.

## Aligment, Margin & Padding

There are three things I wanna change regarding these answers. These answer buttons take up all the available space, leaving some empty to the left and right. In addition, I wanna shuffle them because it's first answer that is the correct one. And third, I wanna make sure that when we tap those answers, we proceed to the next question or after going through all questions to the result screen.

![alt text](images/image-51.png) 
![alt text](images/image-52.png) 

## Mutating Values in Memory

So how can we shuffle these list items here?  
Flutter gives us a shuflle method that can be called on lists. It is a built-in method that can be called on lists to change the orde of the items in the lists. However, what's important to understand regarding Shuffle, is that unlike map, it does change the original list.  
I actually don't wanna change this list of answers, I wanna make sure that the correct answer stays the first answer here and therefore we have to first copy this list before we shuffle it, otherwise, finding out which answer was the correct answer will be impossible after these answers have been shuffled. So therefore, to make sure that we're shuffling the answers in a brand new list, we can go to this QuizQuestion class, which we added earlier which is our blueprint for these questions. 

![alt text](images/image-53.png) 
![alt text](images/image-54.png)   
we can now use these getShuffledAnswers, we can use here and then map those shuffled answers to our answers buttons.  
we do all these things withoutt changing the original answers list.  

![alt text](images/image-55.png)  
You'll see that now I have a different order than I did before.  

## Managing The Questions Index As State

Now with those shuffled answer being displayed here, it's time to make sure that once we select an answer, we move on the next answer in line.

![alt text](images/image-56.png)  
![alt text](images/image-57.png) 
![alt text](images/image-58.png)
![alt text](images/image-59.png) 
![alt text](images/image-60.png)
![alt text](images/image-61.png) 
![alt text](images/image-62.png)
![alt text](images/image-63.png) 
![alt text](images/image-64.png)

At some point we'll reach an error here because at some point we try to move on to a question that doesn't exist because we never stop increaming currentQuestionIndex.

## More on Button Styling

![alt text](images/image-65.png)  
Some answers look quite ugly because the text is not centered. And I also wanna change how that question text here look like because I think it could out a bit more. 

![alt text](images/image-66.png) 
![alt text](images/image-67.png) 

All texts are centered.

## Using Third-Party Packages & Adding Google Fonts

Next goal is to adjust the styling of question text.  

```
flutter pub add google_fonts
```
This command will install this package into this project. And as part of this installation process, it will also add in the pubspec.yaml file.

![alt text](images/image-68.png) 

![alt text](images/image-69.png) 

![alt text](images/image-70.png) 

You now see taht the question text look differently, that a different font is used and that it's a bit bigger.

![alt text](images/image-71.png) 

![alt text](images/image-72.png) 

We could also do it on the start screen.