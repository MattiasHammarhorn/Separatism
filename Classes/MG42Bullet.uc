//=============================================================================
// MG42Bullet
//=============================================================================
// Bullet for the MG42 LMG
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Martin Cooke @ Antimatter Games, modified by me
//=============================================================================
class MG42Bullet extends ROBullet;

defaultproperties
{
    BallisticCoefficient=0.390
    Damage=115
    MyDamageType=class'SMDmgType_MG42Bullet'
    Speed=43000         //860m/s    //MuzzleVel(m/s) *50
    MaxSpeed=43000      //860m/s    //MuzzleVel(m/s) *50
    // Customized to have less falloff damage until it gets to a long range
    VelocityDamageFalloffCurve=(Points=((InVal=0.0,OutVal=0.0),(InVal=0.4,OutVal=1.0),(InVal=1.0,OutVal=1.0)))
}