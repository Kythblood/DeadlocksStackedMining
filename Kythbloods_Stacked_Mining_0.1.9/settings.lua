data:extend(
{
	{
        type = "string-setting",
		name = "kyth-overwrite-deadlock-stack-size",
		order = "a",
		setting_type = "startup",
		default_value = "disabled",
		allowed_values = {
            "disabled",
			"4",
			"5", 
			"8",
			"10",
			"16",
			"25",
			"32",
			"50",
			"64",
			"100",
			"128"
        }
    }
})
