class SMRoleInfoNorthernMachineGunner extends SMRoleInfoNorthernInfantry;

defaultproperties
{
    RoleType=RORIT_MachineGunner
    ClassTier=2
    ClassIndex=`ROCI_MACHINEGUNNER // 2

    Items[RORIGM_Default]={(
                    PrimaryWeapons=(class'ROGame.ROWeap_RPD_LMG'),
                    OtherItems=(class'ROGame.ROWeap_M61_GrenadeSingle')
    )}

    bAllowPistolsInRealism=true

    ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_mg'
    ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_mg'
}