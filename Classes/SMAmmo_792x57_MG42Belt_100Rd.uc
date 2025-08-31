//=============================================================================
// SMAmmo_792x57_MG42Belt_100Rd
//=============================================================================
// Ammo properties for the 7.92 x 57R MG42 100 round belt
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by John "Ramm-Jaeger" Gibson @ Tripwire Interactive LLC, modified by me
//=============================================================================

class SMAmmo_792x57_MG42Belt_100Rd extends ROAmmunition;

defaultproperties
{
    CompatibleWeaponClasses(0)=class'Separatism.SMWeap_MG42_LMG'

    InitialAmount=100
    Weight=2.96 // calculated by scaling MG34's 150 belt down to 100
    ClipsPerSlot=1.0
}