Overview

This repository contains the implementation of a Stack class that supports efficient push, pop, and max operations, along with an Extras class that extends Stack by adding a mean method.

Stack Class

The Stack class is designed to efficiently handle a large number of push operations (up to 10 million numbers) while ensuring that the max method is optimized for frequent calls. It provides the following methods:

push(number: int): Adds an unsigned integer number to the stack while maintaining the order in which it was pushed.

pop() -> int: Removes and returns the last pushed number, following the First-In-Last-Out (FILO) principle.

max() -> int: Returns the highest number in the stack in the most efficient way possible.

Extras Class

The Extras class extends Stack and introduces an additional method:

mean() -> float: Efficiently calculates and returns the average of the numbers in the stack, ensuring optimized performance.

Performance Considerations

The max method is designed for O(1) time complexity by maintaining a separate stack to track maximum values.

The mean method in the Extras class maintains a running sum to allow O(1) average calculation, ensuring minimal computational overhead.
