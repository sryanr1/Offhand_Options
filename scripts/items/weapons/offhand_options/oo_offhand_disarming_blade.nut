this.oo_offhand_disarming_blade <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.oo_offhand_disarming_blade";
		this.m.Name = "Offhand Disarming Blade";
		this.m.Description = "A lightweight hooked blade, meant to be wielded in the offhand to disarm attacking foes.";
		this.m.Categories = "Sword, One-Handed";
		this.m.IconLarge = "weapons/melee/romphaia_01.png";
		this.m.Icon = "weapons/melee/romphaia_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_rhomphaia_01";
		this.m.Condition = 50.0;
		this.m.ConditionMax = 50.0;
		this.m.StaminaModifier = -5;
		this.m.Value = 250;
		this.m.RegularDamage = 0;
		this.m.RegularDamageMax = 0;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 1.0;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/effects/offhand_options_effects/oo_disarming_effect"));
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});