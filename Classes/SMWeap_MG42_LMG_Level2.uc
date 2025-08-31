//=============================================================================
// SMWeap_MG42_LMG_Level2
//=============================================================================
// MG42 light machine gun with 100-round ammo belt
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Martin Cooke @ Antimatter Games, modified by me
//=============================================================================
class SMWeap_MG42_LMG_Level2 extends SMWeap_MG42_LMG_Content;

var             Array<name>             Bullets;

simulated function FireAmmunition()
{
    Super.FireAmmunition();

    // Hide a bullet from the ammo belt evertime we fire ar ound
    if( WorldInfo.NetMode != NM_DedicatedServer && AmmoBeltMesh != None && AmmoCount < Bullets.length )
    {
        AmmoBeltMesh.HideBoneByName(Bullets[AmmoCount], PBO_None);
    }
}

/**
 * Unhide entire ammo clip. Usually called via AnimNotify_Script in the reload animations
 */
simulated function UnHideBulletsNotify()
{
    local int i;

    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        for( i=0; i<Bullets.Length; i++ )
        {
            AmmoBeltMesh.UnHideBoneByName(Bullets[i]);
        }
    }
}

// Reset the visible ammo belt and ensure that the correct number of rounds are being displayed
simulated function PlayWeaponEquip()
{
    local int i;

    Super.PlayWeaponEquip();

    if( AmmoBeltMesh != none )
    {
        // We don't know where we're up to, so start over
        UnHideBulletsNotify();

        // Hide the bullets up to the current ammo count
        for( i=(Bullets.Length-1); i>0; i-- )
        {
            AmmoBeltMesh.HideBoneByName(Bullets[i], PBO_None);
            if( i <= AmmoCount)
            {
                break;
            }
        }
    }
}

defaultproperties
{
    AttachmentClass=class'Separatism.SMWeapAttach_MG42_LMG_Level2'

    ArmsAnimSet=AnimSet'SM_WP_MG42_LMG.Anims.WP_MG42_UPGD2hands'

    // Weapon SkeletalMesh
    Begin Object Name=FirstPersonMesh
        SkeletalMesh=SkeletalMesh'SM_WP_MG42_LMG.Mesh.Ger_MG42_UPGD2'
        AnimSets(0)=AnimSet'SM_WP_MG42_LMG.Anims.WP_MG42_UPGD2hands'
    End Object

    // Pickup staticmesh
    Begin Object Name=PickupMesh
        SkeletalMesh=SkeletalMesh'SM_WP_MG42_LMG.Mesh.MG42_3rd_Master_UPGD2'
    End Object

    // Ammo belt SkeletalMesh
    Begin Object Class=ROAmmoBeltMesh Name=AmmoBelt0
        SkeletalMesh=SkeletalMesh'SM_WP_MG42_LMG.Mesh.Ger_MG42_Belt_UPGD2'
        PhysicsAsset=none
        AnimSets.Add(AnimSet'SM_WP_MG42_LMG.Anims.WP_MG42_Belt_UPGD2')
        DepthPriorityGroup=SDPG_Foreground
        bOnlyOwnerSee=true
        MaxAmmoShown=22
    End Object
    AmmoBeltMesh=AmmoBelt0

    AmmoBeltSocket=AmmoBeltSocket

    // Ammo
    AmmoClass=class'SMAmmo_792x57_MG42Belt_100Rd'
    MaxAmmoCount=100
    InitialNumPrimaryMags=2
    MaxNumPrimaryMags=4
    NumMagsToResupply=1

    Bullets(0)=BONE_BELT_01
    Bullets(1)=BONE_BELT_02
    Bullets(2)=BONE_BELT_03
    Bullets(3)=BONE_BELT_04
    Bullets(4)=BONE_BELT_05
    Bullets(5)=BONE_BELT_06
    Bullets(6)=BONE_BELT_07
    Bullets(7)=BONE_BELT_08
    Bullets(8)=BONE_BELT_09
    Bullets(9)=BONE_BELT_10
    Bullets(10)=BONE_BELT_11
    Bullets(11)=BONE_BELT_12
    Bullets(12)=BONE_BELT_13
    Bullets(13)=BONE_BELT_14
    Bullets(14)=BONE_BELT_15
    Bullets(15)=BONE_BELT_16
    Bullets(16)=BONE_BELT_17
}