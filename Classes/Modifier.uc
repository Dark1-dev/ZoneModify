/*
|------------------------------------------------------|
|                ZoneModify.Modifier                   |
|            Created by Dark1 (22/10/2022)             |
|    Licensed under GNU General Public License v3.0    |
|------------------------------------------------------|
*/

class Modifier expands Mutator Config(Mutators);

var() config float Gravity;
var() config float GroundFriction;
var() config float FluidFriction;
var() config float TerminalVelocity;
var() config int MaxCarcassNum;

function BeginPlay()
{
    Super.BeginPlay();
    BroadcastMessage("ZoneModify Loaded.");
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    if (Other.IsA('ZoneInfo'))
    {
      ZoneInfo(Other).ZoneGravity.Z = Gravity;
      ZoneInfo(Other).ZoneGroundFriction = GroundFriction;
      ZoneInfo(Other).ZoneFluidFriction = FluidFriction;
      ZoneInfo(Other).ZoneTerminalVelocity = TerminalVelocity;
      ZoneInfo(Other).MaxCarcasses = MaxCarcassNum;
    }
   return true;
}

defaultproperties
{
    Gravity=-950.000000
    GroundFriction=8.000000
    FluidFriction=1.200000
    TerminalVelocity=2500.000000
    MaxCarcassNum=3
}
