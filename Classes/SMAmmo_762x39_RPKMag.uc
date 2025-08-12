//=============================================================================
// ROAmmo_762x51_L2A1Mag
//=============================================================================
// 30 round magazine Ammo properties for the 7.62 x 51mm L2A1.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2017 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class SMAmmo_762x39_RPKMag extends ROAmmunition
    abstract;

defaultproperties
{
    CompatibleWeaponClasses(0)=class'Separatism.SMWeap_RPK_LMG'

    InitialAmount=40
    Weight=1.06
    ClipsPerSlot=2
}