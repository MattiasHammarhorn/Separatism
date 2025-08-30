//=============================================================================
// SMDmgType_MG42Bullet
//=============================================================================
// Damage type for a bullet fired from the MG42 LMG
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Martin Cooke @ Antimatter Games, modified by me
//=============================================================================
class SMDmgType_MG42Bullet extends RODmgType_SmallArmsBullet
    abstract;

defaultproperties
{
    WeaponShortName="MG42"
    KDamageImpulse=625
    BloodSprayTemplate=ParticleSystem'FX_VN_Impacts.BloodNGore.FX_VN_BloodSpray_Clothes_large'
}