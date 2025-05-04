//=============================================================================
// ROWeapAttach_SKS_Rifle
//=============================================================================
// 3rd person Weapon attachment class for the Zastava M59/66A1 Rifle
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeapAttach_SKSYugo_Rifle extends ROWeapAttach_SKS_Rifle;

defaultproperties
{
    WeaponClass=class'SMWeap_SKSYugo_Rifle'

	// Weapon SkeletalMesh
    Begin Object Name=SkeletalMeshComponent0
        SkeletalMesh=SkeletalMesh'SM_WP_SKS.Mesh.SM_SKSYugo_3rd_Master'
        AnimSets(0)=AnimSet'WP_VN_3rd_Master.Anim.SKS_3rd_Anims'
        AnimTreeTemplate=AnimTree'WP_VN_3rd_Master.AnimTree.SKS_Rifle_3rd_Tree'
        Animations=none
        PhysicsAsset=none
        CullDistance=5000
    End Object
}