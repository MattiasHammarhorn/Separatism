//=============================================================================
// SMAmmo_762x25TTYugoMag
//=============================================================================
// Ammo properties for the 7.62 x 25mm Yugo TT33 9 round magazine
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Christian "schneidzekk" Schneider, modified by me
//=============================================================================
class SMAmmo_762x25_TTYugoMag extends ROAmmunition
    abstract;

defaultproperties
{
    CompatibleWeaponClasses(0)=class'Separatism.SMWeap_TTYugo_Pistol'
    InitialAmount=9
    Weight=0.174
    ClipsPerSlot=3
}