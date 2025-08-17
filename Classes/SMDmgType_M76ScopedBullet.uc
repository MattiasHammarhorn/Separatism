//=============================================================================
// SMDmgType_M76ScopedBullet
//=============================================================================
// Damage type for a bullet fired from the Zastava M76 Scoped rifle
//=============================================================================
// RO: Heroes of Stalingrad Source
// Copyright (C) 2010 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class SMDmgType_M76ScopedBullet extends RODmgType_SmallArmsBullet
    abstract;

defaultproperties
{
    WeaponShortName="M76"
    KDamageImpulse=625
    BloodSprayTemplate=ParticleSystem'FX_VN_Impacts.BloodNGore.FX_VN_BloodSpray_Clothes_large'
}