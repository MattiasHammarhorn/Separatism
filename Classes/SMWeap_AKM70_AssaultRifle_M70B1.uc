//=============================================================================
// SMWeap_AKM70_AssaultRifle_M70B1
//=============================================================================
// Content for Zastava M70 Assault Rifle - M70B1
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeap_AKM70_AssaultRifle_M70B1 extends ROWeap_AK47_AssaultRifle_AKM;

defaultproperties
{
    Begin Object Name=FirstPersonMesh
        SkeletalMesh=SkeletalMesh'SM_WP_AK47.Mesh.SM_AKM70_UPGD1'
        AnimSets(0)=AnimSet'WP_VN_VC_AK47.Animation.WP_AK47hands_UPGD3'
        AnimTreeTemplate=AnimTree'WP_VN_VC_AK47.Animation.VC_AK47_UPGD3_Tree'
    End Object

    Begin Object Name=PickupMesh
        SkeletalMesh=SkeletalMesh'WP_VN_3rd_Master.Mesh_UPGD.AK47_3rd_Master_UPGD3'
        AnimTreeTemplate=AnimTree'WP_VN_3rd_Master.AnimTree.AKM_AssaultRifle_3rd_Tree'
    End Object
}