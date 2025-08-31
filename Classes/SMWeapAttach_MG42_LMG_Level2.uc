//=============================================================================
// SMWeapAttach_MG42_LMG
//=============================================================================
// 3rd person Weapon attachment class for the MG42 LMG
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt Martin Cooke @ Antimatter Games, modified by me
//=============================================================================
class SMWeapAttach_MG42_LMG_Level2 extends SMWeapAttach_MG42_LMG;

defaultproperties
{
    WeaponClass=class'SMWeap_MG42_LMG'

    // Weapon SkeletalMesh
    Begin Object Name=SkeletalMeshComponent0
        SkeletalMesh=SkeletalMesh'SM_WP_MG42_LMG.Mesh.MG42_3rd_Master_UPGD2'
        AnimSets(0)=AnimSet'SM_WP_MG42_LMG.Anims.MG42_UPGD2_3rd_anim'
    End Object
    
    //ROPawn weapon specific animations
	CHR_AnimSet=AnimSet'CHR_VN_ARVN_Playeranim_Master.Weapons.CHR_M1919LMG'
}