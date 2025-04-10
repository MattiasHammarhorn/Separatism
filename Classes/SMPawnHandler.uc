class SMPawnHandler extends ROPawnHandler
    config(Mutator_SM_Char);

// var         CharacterConfig         RandomConfig;
var config  CharacterConfig         JNAConfig;
var config  CharacterConfig         ZNGConfig;

var config array<CharacterConfig>   JNAConfigsByClass;
var config array<CharacterConfig>   ZNGConfigsByClass;

// Yugoslav People's Army (JNA)
var array<TunicInfo>        JNATunics;
var array<HeadgearInfo>     JNAHeadgear;
var array<HeadgearMICInfo>  JNAHeadgearMICs;
var array<FieldgearMeshes>  JNAFieldgearByRole;
var array<ShirtInfo>        JNAShirts;
var array<TattooInfo>       JNATattoos;

// Croatian National Guard (ZNG)
var array<TunicInfo>        ZNGTunics;
var array<HeadgearInfo>     ZNGHeadgear;
var array<HeadgearMICInfo>  ZNGHeadgearMICs;
var array<FieldgearMeshes>  ZNGFieldgearByRole;
var array<ShirtInfo>        ZNGShirts;
var array<TattooInfo>       ZNGTattoos;

// Heads by Ethnicity
var array<PlayerHeadInfo>   SerbianHeads;
var array<PlayerHeadInfo>   CroatianHeads;

var array<FaceItemInfo>     SerbianFaceItems;
var array<FaceItemInfo>     CroatianFaceItems;

var array<FacialHairInfo>     SerbianFacialHair;
var array<FacialHairInfo>     CroatianFacialHair;

static function GetCharConfig(int Team, int ArmyIndex, byte bPilot, int ClassIndex, int HonorLevel, out byte TunicID, out byte TunicMaterialID, out byte ShirtID, out byte HeadID, out byte HairID, out byte HeadgearID, out byte HeadgearMatID, out byte FaceItemID, out byte FacialHairID, out byte TattooID, ROPlayerReplicationInfo ROPRI, optional bool bRandomiseAll, optional bool bInitByMenu, optional out byte bUseBase)
{
    local CharacterConfig TempCharConfig;

    // if( ClassIndex < 0)
    //     bUseBase = 1;
    
    // if( bRandomiseAll )
    // {
    //     TempCharConfig = default.RandomConfig;
    // }
    // else
    if( Team == `AXIS_TEAM_INDEX )
    {
        TempCharConfig = default.JNAConfigsByClass[ClassIndex];
    }
    else
    {
        TempCharConfig = default.ZNGConfigsByClass[ClassIndex];
    }

    TunicID = TempCharConfig.TunicMesh;
    TunicMaterialID = TempCharConfig.TunicMaterial;
    ShirtID = TempCharConfig.ShirtTexture;
    HeadID = TempCharConfig.HeadMesh;
    HairID = TempCharConfig.HairMaterial;
    HeadgearID = TempCharConfig.HeadgearMesh;
    HeadgearMatID = TempCharConfig.HeadgearMaterial;
    FaceItemID = TempCharConfig.FaceItemMesh;
    FacialHairID = TempCharConfig.FacialHairMesh;
    TattooID = TempCharConfig.TattooTex;

    if( !bInitByMenu )
        ValidateCharConfig(Team, ArmyIndex, bPilot, HonorLevel, TunicID, TunicMaterialID, ShirtID, HeadID, HairID, HeadgearID, HeadgearMatID, FaceItemID, FacialHairID, TattooID, ROPRI);
}

static function SaveCharConfig(int Team, int ArmyIndex, byte bPilot, int ClassIndex, int HonorLevel, out byte TunicID, out byte TunicMaterialID, out byte ShirtID, out byte HeadID, out byte HairID, out byte HeadgearID, out byte HeadgearMatID, out byte FaceItemID, out byte FacialHairID, out byte TattooID, byte bUseBase)
{
    local CharacterConfig TempCharConfig;

    TempCharConfig.TunicMesh = TunicID;
    TempCharConfig.TunicMaterial = TunicMaterialID;
    TempCharConfig.ShirtTexture = ShirtID;
    TempCharConfig.HeadMesh = HeadID;
    TempCharConfig.HairMaterial = HairID;
    TempCharConfig.HeadgearMesh = HeadgearID;
    TempCharConfig.HeadgearMaterial = HeadgearMatID;
    TempCharConfig.FaceItemMesh = FaceItemID;
    TempCharConfig.FacialHairMesh = FacialHairID;
    TempCharConfig.TattooTex = TattooID;

    if( Team == `AXIS_TEAM_INDEX )
    {
        default.JNAConfigsByClass[ClassIndex] = TempCharConfig;
    }
    else
    {
        default.ZNGConfigsByClass[ClassIndex] = TempCharConfig;
    }

    StaticSaveConfig();
}

static function bool CopyConfigToClass(int Team, int ArmyIndex, int SourceClassIndex, int TargetClassIndex)
{
    local int i;
    local array<CharacterConfig> TargetCharConfigs;
    
    if( SourceClassIndex == TargetClassIndex || (TargetClassIndex != -1 && 
        ((SourceClassIndex > `ROCI_COMMANDER && TargetClassIndex <= `ROCI_COMMANDER) ||
        (SourceClassIndex <= `ROCI_COMMANDER && TargetClassIndex > `ROCI_COMMANDER))) )
    {
        return false;
    }

    // Grab the relevant struct first and foremost
    if( Team == `AXIS_TEAM_INDEX )
    {
        TargetCharConfigs = default.JNAConfigsByClass;
    }
    else
    {
        TargetCharConfigs = default.ZNGConfigsByClass;
    }

    // Copy the relevant classes
    if( TargetClassIndex == -1 )
    {
        // Pilot
        if( SourceClassIndex > `ROCI_COMMANDER )
        {
            for(i=`ROCI_COMBATPILOT; i<=`ROCI_TRANSPORTPILOT; i++)
            {
                if( i != SourceClassIndex )
                {
                    TargetCharConfigs[i] = TargetCharConfigs[SourceClassIndex];
                }
            }
        }
        // Infantry
        else
        {
            for(i=0;i<`ROCI_COMBATPILOT; i++)
            {
                if( i != SourceClassIndex )
                {
                    TargetCharConfigs[i] = TargetCharConfigs[SourceClassIndex];
                }
            }
        }
    }
    else if ( SourceClassIndex < TargetCharConfigs.length )
    {
        TargetCharConfigs[TargetClassIndex] = TargetCharConfigs[SourceClassIndex];
    }

    // Set and store the config back to the correct struct again
    if( Team == `AXIS_TEAM_INDEX )
    {
        default.JNAConfigsByClass = TargetCharConfigs;
    }
    else
    {
        default.ZNGConfigsByClass = TargetCharConfigs;
    }

    StaticSaveConfig();
    return true;
}

static function array<TunicInfo> GetTunicArray(byte TeamIndex, byte ArmyIndex, optional byte bPilot)
{
    if( TeamIndex == `AXIS_TEAM_INDEX )
        return default.JNATunics;
    else
        return default.ZNGTunics;
}

static function SkeletalMesh GetFieldgearMesh(int Team, int ArmyIndex, int TunicMeshID, int ClassIndex, byte BodyMIC)
{
    if( Team == `AXIS_TEAM_INDEX )
        return default.JNAFieldgearByRole[ClassIndex].FieldgearByTunicType[0];
    else
        return default.ZNGFieldgearByRole[ClassIndex].FieldgearByTunicType[0];
}

static function array<ShirtInfo> GetShirtArray(byte TeamIndex, byte ArmyIndex, optional byte bPilot)
{
    if( TeamIndex == `AXIS_TEAM_INDEX )
        return default.JNAShirts;
    else
        return default.ZNGShirts;
}

static function array<PlayerHeadInfo> GetHeadArray(byte TeamIndex, byte ArmyIndex, optional byte bPilot)
{
    if( TeamIndex == `AXIS_TEAM_INDEX )
        return default.SerbianHeads;
    else
        return default.CroatianHeads;
}

static function array<HeadgearInfo> GetHeadgearArray(byte TeamIndex, byte ArmyIndex, optional byte bPilot)
{
    if( TeamIndex == `AXIS_TEAM_INDEX )
        return default.JNAHeadgear;
    else
        return default.ZNGHeadgear;
}

static function array<HeadgearMICInfo> GetHeadgearMICArray(byte TeamIndex, byte ArmyIndex, optional byte bPilot)
{
    if( TeamIndex == `AXIS_TEAM_INDEX )
        return default.JNAHeadgearMICs;
    else
        return default.ZNGHeadgearMICs;
}

static function array<FaceItemInfo> GetFaceItemArray(byte TeamIndex, byte ArmyIndex, optional byte bPilot)
{
    if( TeamIndex == `AXIS_TEAM_INDEX )
        return default.SerbianFaceItems;
    else
        return default.CroatianFaceItems;
}

static function array<FacialHairInfo> GetFacialHairArray(byte TeamIndex, byte ArmyIndex)
{
    if( TeamIndex == `AXIS_TEAM_INDEX )
        return default.SerbianFacialHair;
    else
        return default.CroatianFacialHair;
}

static function array<TattooInfo> GetTattooArray(byte TeamIndex, byte ArmyIndex, optional byte bPilot)
{
    if( TeamIndex == `AXIS_TEAM_INDEX )
        return default.JNATattoos;
    else
        return default.ZNGTattoos;
}

static function bool GetShirtTextures(int Team, int ArmyIndex, byte bPilot, byte TunicMeshID, byte ShirtID, out Texture2D ShirtD, out Texture2D ShirtN, out Texture2D ShirtS)
{
    local array<ShirtInfo> TempShirts;

    TempShirts = GetShirtArray(Team, ArmyIndex, bPilot);

    ShirtD = TempShirts[ShirtID].ShirtD;
    ShirtN = TempShirts[ShirtID].ShirtN;
    ShirtS = TempShirts[ShirtID].ShirtS;
    return true;
}

defaultproperties
{
    /****************************
	  * Yugoslav People's Army (JNA)
	  ***************************/
      // Tunics
      // Full M77 tunic
      JNATunics(0)={( TunicMesh=SkeletalMesh'SM_CHR_JNA.Mesh.JNA_Tunic_Long_Mesh',
                      ArmsMeshFP=SkeletalMesh'SM_CHR_1stP_Hands_Master.Mesh.SM_1stP_JNA_Long_Mesh',
                      BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'SM_CHR_JNA.Materials.M_JNA_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'SM_CHR_1stP_Hands_Master.Materials.M_SM_1stP_JNA_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan')),
                      SkinToShow=STS_HeadHands,
                      UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
                      LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_NVA_Long'
                      )}

      // M77 shirt, long sleeves
      JNATunics(1)={( TunicMesh=SkeletalMesh'SM_CHR_JNA.Mesh.JNA_Tunic_Shirt_Long_Mesh',
                      ArmsMeshFP=SkeletalMesh'SM_CHR_1stP_Hands_Master.Mesh.SM_1stP_JNA_Shirt_Long_Mesh',
                      BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'SM_CHR_JNA.Materials.M_JNA_Tunic_Shirt_Long_INST',SleeveMICFP=MaterialInstanceConstant'SM_CHR_1stP_Hands_Master.Materials.M_SM_1stP_JNA_Shirt_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_JungleGreen'),
                        (BodyMICTemplate=MaterialInstanceConstant'SM_CHR_JNA.Materials.M_JNA_Tunic_Shirt_Long_Oakleaf_INST',SleeveMICFP=MaterialInstanceConstant'SM_CHR_1stP_Hands_Master.Materials.M_SM_1stP_JNA_Shirt_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_JungleGreen')),
                      SkinToShow=STS_HeadHands,
                      UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
                      LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_Long'
                      )}
    
      // M77 shirt, rolled sleeves
      JNATunics(2)={( TunicMesh=SkeletalMesh'SM_CHR_JNA.Mesh.JNA_Tunic_Shirt_Rolled_Mesh',
                      ArmsMeshFP=SkeletalMesh'SM_CHR_1stP_Hands_Master.Mesh.SM_1stP_JNA_Shirt_Rolled_Mesh',
                      BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'SM_CHR_JNA.Materials.M_JNA_Tunic_Shirt_Long_INST',SleeveMICFP=MaterialInstanceConstant'SM_CHR_1stP_Hands_Master.Materials.M_SM_1stP_JNA_Shirt_Rolled_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_JungleGreen'),
                        (BodyMICTemplate=MaterialInstanceConstant'SM_CHR_JNA.Materials.M_JNA_Tunic_Shirt_Long_Oakleaf_INST',SleeveMICFP=MaterialInstanceConstant'SM_CHR_1stP_Hands_Master.Materials.M_SM_1stP_JNA_Shirt_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_JungleGreen')),
                      SkinToShow=STS_HeadForearms,
                      UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
                      LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_Rolled'
                      )}

      JNAShirts(0)=(ShirtD=Texture2D'SM_CHR_JNA.Textures.Head_Generic_WhiteShirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Vest_White')
      JNAShirts(1)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_WhiteVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_White')
      JNAShirts(2)=(ShirtD=none,ShirtN=none,ShirtS=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None') // According to AMG, this should never be accessed, but it keeps the compiler happy
    
      JNATattoos(0)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.no_tattoo',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Blank')

      JNAFieldgearByRole(`ROCI_RIFLEMAN)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_JNA.GearMesh.JNA_Gear_Long_Rifleman'))
      JNAFieldgearByRole(`ROCI_SCOUT)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_JNA.GearMesh.JNA_Gear_Long_Scout'))
      JNAFieldgearByRole(`ROCI_MACHINEGUNNER)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_JNA.GearMesh.JNA_Gear_Long_Machinegunner'))
      JNAFieldgearByRole(`ROCI_SNIPER)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_JNA.GearMesh.JNA_Gear_Long_Marksman'))
      JNAFieldgearByRole(`ROCI_ENGINEER)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_JNA.GearMesh.JNA_Gear_Long_Sapper'))
      JNAFieldgearByRole(`ROCI_ANTITANK)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_JNA.GearMesh.JNA_Gear_Long_Grenadier'))
      JNAFieldgearByRole(`ROCI_RADIOMAN)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_JNA.GearMesh.JNA_Gear_Long_Radioman'))
      JNAFieldgearByRole(`ROCI_COMMANDER)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_JNA.GearMesh.JNA_Gear_Long_Commander'))
    
      JNAHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_JNA_Headgear.Mesh.JNA_Headgear_M59-85'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_SSh39'))
      JNAHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_JNA_Headgear.Mesh.JNA_Headgear_Titovka'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_Cap'))
      JNAHeadgear(2)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_JNA_Headgear.Mesh.JNA_Headgear_M59-85Folded'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_SSh39'))
      JNAHeadgear(3)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_JNA_Headgear.Mesh.JNA_Headgear_M59-85_StickerJA'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_SSh39'))
      JNAHeadgear(4)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_JNA_Headgear.Mesh.JNA_Headgear_M59-85_StickerJNA'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_SSh39'))
      JNAHeadgear(5)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_JNA_Headgear.Mesh.JNA_Headgear_M59-85MOL'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Standard'))

      JNAHeadgearMICs(0)=(HeadgearMICTemplate=MaterialInstanceConstant'SM_CHR_JNA_Headgear.Materials.M_JNA_Headgear_INST')
      JNAHeadgearMICs(1)=(HeadgearMICTemplate=MaterialInstanceConstant'SM_CHR_JNA_Headgear.Materials.M_JNA_Headgear_Hair_INST')

      SerbianHeads(0)=(HeadMesh=SkeletalMesh'CHR_VN_AUS_Heads.Mesh.AUS_Head10_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Pants_Torn_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_AUS_04')
      SerbianHeads(1)=(HeadMesh=SkeletalMesh'CHR_VN_AUS_Heads.Mesh.AUS_Head9_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Pants_Torn_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_AUS_01')

      SerbianFaceItems(0)=(FaceItemMesh=none,FaceItemSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')
      SerbianFaceItems(1)=(FaceItemMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_eyewear_GIglasses',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_Glasses')
      SerbianFaceItems(2)=(FaceItemMesh=SkeletalMesh'CHR_VN_VN_Headgear.Mesh_eyewear.VN_Eyewear_Shades',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_Viet_Shades')
      SerbianFaceItems(3)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.ALL_Mouth_Cigarette',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_US_Cigar')

      SerbianFacialHair(0)=(FacialHairMesh=none,FacialHairSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')
      SerbianFacialHair(1)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_smallstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_01')
      SerbianFacialHair(2)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_mediumstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_02')
      SerbianFacialHair(3)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_longstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_03')
      SerbianFacialHair(4)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_goat',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_PT_Goatee')
      SerbianFacialHair(5)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_chops',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_PT_MouthChops')
      SerbianFacialHair(6)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_full',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_PT_FullBeard')

    /****************************
	  * Croatian National Guard (ZNG)
	  ***************************/
      // Tunics
      // Full M65 tunic
      ZNGTunics(0)={( TunicMesh=SkeletalMesh'SM_CHR_HV.Mesh.HV_Tunic_Long_Mesh',
                      ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Long_Mesh',
                      BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'SM_CHR_HV.Materials.M_HV_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL')),
                      SkinToShow=STS_HeadHands,
                      UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
                      LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USMC_Long'
                      )}
    
      // HV tunic, long sleeves
      ZNGTunics(1)={( TunicMesh=SkeletalMesh'SM_CHR_HV.Mesh.HV_Tunic_Shirt_Long_Mesh',
                      ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Long_Mesh',
                      BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'SM_CHR_HV.Materials.M_HV_Tunic_Shirt_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL')),
                      SkinToShow=STS_HeadHands,
                      UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
                      LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_Long'
                      )}

      // HV tunic, rolled sleeves
      ZNGTunics(2)={( TunicMesh=SkeletalMesh'SM_CHR_HV.Mesh.HV_Tunic_Shirt_Rolled_Mesh',
                      ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
                      BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'SM_CHR_HV.Materials.M_HV_Tunic_Shirt_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL')),
                      SkinToShow=STS_HeadForearms,
                      UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
                      LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_Rolled'
                      )}
      // HV pants only
      ZNGTunics(3)={( TunicMesh=SkeletalMesh'SM_CHR_HV.Mesh.HV_Tunic_Pants_Mesh',
                      ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
                      BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'SM_CHR_HV.Materials.M_HV_Tunic_Shirt_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL')),
                      SkinToShow=STS_AboveWaist,
                      UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
                      LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
                      LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
                      ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_Pants'
                      )}

      // Military sweater, long sleeves
    //   ZNGTunics(1)={( TunicMesh=SkeletalMesh'SM_CHR_HV.Mesh.HV_Tunic_Sweater_Long_Mesh',
    //                   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_NVA_Long_Mesh',
    //                   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'SM_CHR_HV.Materials.M_HV_Tunic_Sweater_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL')),
    //                   SkinToShow=STS_HeadHands,
    //                   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
    //                   LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
    //                   RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
    //                   LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
    //                   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
    //                   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USMC_Long'
    //                   )}

      // M65 pants only
    //   ZNGTunics(2)={( TunicMesh=SkeletalMesh'SM_CHR_HV.Mesh.HV_Tunic_M65_Pants_Mesh',
    //                   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_All_Bare_Mesh',
    //                   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'SM_CHR_HV.Materials.M_HV_Tunic_M65_Long_Woodland_INST')),
    //                   SkinToShow=STS_AboveWaist,
    //                   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
    //                   LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
    //                   RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
    //                   LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
    //                   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
    //                   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_USMC_Long'
    //                   )}

      ZNGShirts(0)=(ShirtD=none,ShirtN=none,ShirtS=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None') // According to AMG, this should never be accessed, but it keeps the compiler happy
      ZNGShirts(1)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_blackshirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Black')
      ZNGShirts(2)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_BlackVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Black')
      ZNGShirts(3)=(ShirtD=Texture2D'SM_CHR_HV.Textures.Head_Generic_WoodlandShirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Olive')
    
      ZNGTattoos(0)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.no_tattoo',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Blank')

      ZNGFieldgearByRole(`ROCI_RIFLEMAN)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_HV.GearMesh.HV_Gear_Long_Rifleman'))
      ZNGFieldgearByRole(`ROCI_SCOUT)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_HV.GearMesh.HV_Gear_Long_Scout'))
      ZNGFieldgearByRole(`ROCI_MACHINEGUNNER)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_HV.GearMesh.HV_Gear_Long_Machinegunner'))
      ZNGFieldgearByRole(`ROCI_SNIPER)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_HV.GearMesh.HV_Gear_Long_Sniper'))
      ZNGFieldgearByRole(`ROCI_ENGINEER)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_HV.GearMesh.HV_Gear_Long_Sapper'))
      ZNGFieldgearByRole(`ROCI_HEAVY)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_HV.GearMesh.HV_Gear_Long_Grenadier'))
      ZNGFieldgearByRole(`ROCI_RADIOMAN)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_HV.GearMesh.HV_Gear_Long_Radioman'))
      ZNGFieldgearByRole(`ROCI_COMMANDER)=(FieldgearByTunicType=(SkeletalMesh'SM_CHR_HV.GearMesh.HV_Gear_Long_Commander'))

      ZNGHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_HV_Headgear.Mesh.HV_Headgear_Cap1'),HeadgearMICs=(0),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_Cap')
      ZNGHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_HV_Headgear.Mesh.HV_Headgear_Cap2'),HeadgearMICs=(0),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_Cap')
    //   ZNGHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_HV_Headgear.Mesh.HV_Headgear_M59'),HeadgearMICs=(2),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_SSh39'))
      ZNGHeadgear(2)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_HV_Headgear.Mesh.HV_Headgear_M56'),HeadgearMICs=(2),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_M56'))
      ZNGHeadgear(3)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_HV_Headgear.Mesh.HV_Headgear_Ribbon1'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Bandana')
      ZNGHeadgear(4)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_HV_Headgear.Mesh.HV_Headgear_Ribbon2'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Bandana')
      ZNGHeadgear(5)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_HV_Headgear.Mesh.HV_Headgear_M1var1'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_ERDL')
      ZNGHeadgear(6)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_HV_Headgear.Mesh.HV_Headgear_M1var2'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_ERDL')
      ZNGHeadgear(7)=(HeadgearMeshes=(SkeletalMesh'SM_CHR_HV_Headgear.Mesh.HV_Headgear_Beret'),HeadgearMICs=(3),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_BlackBeret')

      ZNGHeadgearMICs(0)=(HeadgearMICTemplate=MaterialInstanceConstant'SM_CHR_HV_Headgear.Materials.M_HV_Headgear_INST')
      ZNGHeadgearMICs(1)=(HeadgearMICTemplate=MaterialInstanceConstant'SM_CHR_HV_Headgear.Materials.M_HV_Headgear_Hair_INST')
      ZNGHeadgearMICs(2)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Headgear.Materials.M_VN_Headgear_Hair_INST')
      ZNGHeadgearMICs(3)=(HeadgearMICTemplate=MaterialInstanceConstant'SM_CHR_HV_Headgear.Materials.M_HV_Headgear_Beret_INST')

      CroatianHeads(0)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head2_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Long_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Rolled_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Torn_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_02')
      CroatianHeads(1)=(HeadMesh=SkeletalMesh'CHR_VN_DLC_US_Heads.Mesh.US_Head11_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_11_Long_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_11_Rolled_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_11_Torn_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_11_Pants_Torn_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_11_Pilot_INST'),SkinToneID=2,HairColours=3,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_US_11')

      CroatianFaceItems(0)=(FaceItemMesh=none,FaceItemSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')
      CroatianFaceItems(1)=(FaceItemMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_eyewear_GIglasses',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_Glasses')
      CroatianFaceItems(2)=(FaceItemMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_eyewear_aviator',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_Aviators')
      CroatianFaceItems(3)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.ALL_Mouth_Cigarette',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_US_Cigar')

      CroatianFacialHair(0)=(FacialHairMesh=none,FacialHairSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')
      CroatianFacialHair(1)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_smallstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_01')
      CroatianFacialHair(2)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_mediumstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_02')
      CroatianFacialHair(3)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_longstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_03')
      CroatianFacialHair(4)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_goat',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_PT_Goatee')
      CroatianFacialHair(5)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_chops',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_PT_MouthChops')
      CroatianFacialHair(6)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_full',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_PT_FullBeard')

    //   RandomConfig=(TunicMesh=255,TunicMaterial=255,ShirtTexture=255,HeadMesh=255,HeadgearMesh=255,TattooTex=255);
}