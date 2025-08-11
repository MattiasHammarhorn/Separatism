class SMRoleInfoNorthernMarksman extends SMRoleInfoNorthernInfantry;

defaultproperties
{
    RoleType=RORIT_Marksman
    ClassTier=3
    ClassIndex=`ROCI_SNIPER // 3

    Items[RORIGM_Default]={(
                    PrimaryWeapons=(class'Separatism.SMWeap_M76Scoped_Rifle'),
                    OtherItems=(class'ROGame.ROWeap_M61_GrenadeSingle')
        )}
    
    bAllowPistolsInRealism=true

    ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_sniper'
    ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_sniper'
}