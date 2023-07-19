# Matrix Search Problem
This is a solution to the Matrix Search problem, where an agent named Neo must navigate a grid to rescue hostages held captive by agents.
- The project is implemented in two different paradigms.
  - 1st using Java
  - 2nd using Prolog

## Problem Representation
The problem is represented as a graph, with nodes representing states and edges representing actions that transform one state to another. 

The state is represented as a string containing information about:
- Grid dimensions (m x n)
- Number of hostages Neo can carry (c)
- Neo's position and health 
- Telephone's position
- Agents' positions
- Pills' positions
- Pads' positions 
- Hostages' positions and damage levels
- Hostages Neo is currently carrying
- Number of agents Neo has killed  
- Number of hostages that have died

## Search Strategies
The following search strategies are implemented:
- Breadth-first search
- Depth-first search
- Iterative deepening search
- Uniform cost search
- Greedy search (based on two different heuristics)
- A* search (based on the two heuristics)

## Heuristics
Two heuristics are used:
- h1 estimates the minimum number of moves required to carry and drop all remaining hostages
- h2 simply counts the number of unrescued hostages remaining

## Functions
The code implements functions for:
- Generating grid strings  
- Visualizing grids  
- Extracting information from grid strings
- Generating successor states 
- Checking for goal states

Hope this helps explain the code! Let me know if you have any other questions.
