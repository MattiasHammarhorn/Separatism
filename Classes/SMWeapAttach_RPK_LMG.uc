//=============================================================================
// SMWeapAttach_RPK_LMG
//=============================================================================
// 3rd person Weapon attachment class for the RPK Light Machine Gun
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeapAttach_RPK_LMG extends ROWeapAttach_L2A1_LMG;

defaultproperties
{
    // Weapon SkeletalMesh
    Begin Object Name=SkeletalMeshComponent0
        SkeletalMesh=SkeletalMesh'SM_WP_RPK.Mesh.SM_RPK_3rd_Master_UPGD1'
        AnimTreeTemplate=AnimTree'WP_VN_AUS_3rd_Master.AnimTree.L2A1_3rd_Tree'
        Animations=NONE
        AnimSets(0)=AnimSet'WP_VN_AUS_3rd_Master.Animation.L2A1_3rd_Anim'
        PhysicsAsset=PhysicsAsset'WP_VN_AUS_3rd_Master.Phy_Bounds.L2A1_3rd_Bounds_Physics'
        CullDistance=5000
    End Object

    WeaponClass=class'SMWeap_RPK_LMG'
}