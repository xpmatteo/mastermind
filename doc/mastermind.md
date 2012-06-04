
Notes about object discovery

- Early design had a "Game" object act as a use case controller.  Its responsibilities were
  - Control flow of execution
  - Be an entry point for the UI
  
Then I invented a History object that remembered the history of guesses and scores.  And I realized that a Mastermind Game *is* a history of the guesses and scores, so I decided that 


   Game
   - know the history of guesses and scores
   
And

   GameInterface 
   - Control flow of execution
   - Be an entry point for the UI
   
My design was almost finished, so I decided to try a robustness analysis.  This means "try variations of the design and see how your design supports the changes".  One thing that bothered me is the name "GameInterface".  It's really not a user interface; being a user interface should be the job of the Console object.  Then I thought: "suppose that we want to switch roles, with the human trying to guess against the computer."  And I had it!  The "GameInterface" object should really be the name of the use case, which is to say "The computer plays as guesser against the human".  You could also have another use case "The computer plays against itself", which could be useful for testing quickly how effective a solution strategy is.

