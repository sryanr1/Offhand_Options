::modOffhandOptions <- {
	Version = "0.1.0",
	ID = "offhandOptions",
	Name = "Offhand Options",
};

::modOffhandOptions.HooksMod <- ::Hooks.register(::modOffhandOptions.ID, ::modOffhandOptions.Version, ::modOffhandOptions.Name);

::modOffhandOptions.HooksMod.queue(">mod_msu", function() {

	::modOffhandOptions.Mod <- ::MSU.Class.Mod(::modOffhandOptions.ID, ::modOffhandOptions.Version, ::modOffhandOptions.Name);


	::modOffhandOptions.HooksMod.hook("scripts/entity/world/settlement", function(q) {

		q.onUpdateShopList = @(__original) function( _id, _list )
		{
			if(_id == "building.marketplace")
			{
				_list.extend([
					{
						R = 30,
						P = 1.0,
						S = "weapons/offhand_options/oo_offhand_disarming_blade"
					},
					{
						R = 30,
						P = 1.0,
						S = "weapons/offhand_options/oo_offhand_echo_sword"
					},
					{
						R = 30,
						P = 1.0,
						S = "weapons/offhand_options/oo_offhand_bleeding_dagger"
					}
				]);
			}
			return __original( _id, _list );
		}
	});

}, ::Hooks.QueueBucket.Late);
