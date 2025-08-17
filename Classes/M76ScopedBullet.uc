//=============================================================================
// M76Scoped_Bullet
//=============================================================================
// 7.92x57mm Bullet class for the Zastava M76 Scoped Rifle.
//=============================================================================
// Original rights goes toTripwire Interactive LLC
//=============================================================================
class M76ScopedBullet extends ROBullet;

defaultproperties
{
    BallisticCoefficient=0.390

    Damage=115
    MyDamageType=class'SMDmgType_M76ScopedBullet'
    Speed=35970         //730m/s
    MaxSpeed=35970      //730m/s

	// Customized to have less falloff damage until it really gets to a long range
    VelocityDamageFalloffCurve=(Points=((InVal=0.0,OutVal=0.0),(InVal=0.4,OutVal=1.0),(InVal=1.0,OutVal=1.0)))
}