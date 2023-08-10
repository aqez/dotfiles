local ls  = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local i   = ls.insert_node
local t   = ls.text_node
local f   = ls.function_node
local c   = ls.choice_node
local sn  = ls.snippet_node

ls.add_snippets("cs", {
    ls.snippet("cls", fmt(
        [[
        {} class {}
        {{
            {}
        }}
    ]],
        {
            c(1, { t("public"), t("private") }),
            i(2, "ClassName"),
            i(0)
        })),
    ls.snippet("mth", fmt(
        [[
        {} {} {}({})
        {{
            {}
        }}
    ]],
        {
            c(1, { t("public"), t("private") }),
            i(2, "void"),
            i(3, "MethodName"),
            i(4, ""),
            i(0)
        })),
    ls.snippet("if", fmt(
        [[
        if ({})
        {{
            {}
        }}
    ]],
        {
            i(1, ""),
            i(0)
        })),
    ls.snippet("fe", fmt(
        [[
        foreach (var {} in {})
        {{
            {}
        }}
    ]],
        {
            i(1, "item"),
            i(2, "collection"),
            i(0)
        })),
    ls.snippet("cw", fmt([[Console.WriteLine($"{}: {{{}}}");]], { rep(1), i(1, "") })),
    ls.snippet("logi", fmt([[_logger.LogInformation($"{}");]], { i(1, "") })),
    ls.snippet("logw", fmt([[_logger.LogWarning($"{}");]], { i(1, "") })),
    ls.snippet("loge", fmt([[_logger.LogError($"{}");]], { i(1, "") })),
    ls.snippet("jcso", fmt([[JsonConvert.SerializeObject({}, null, )]], { i(1, "") })),

    ls.snippet("prop", fmt(
        [[
        public {} {}
        {{
            get {{ return {}; }}
            set {{ {} = value; }}
        }}
        ]],
        {
            i(1, "int"),
            i(2, "PropertyName"),
            i(2),
            i(2)
        })),

    ls.snippet("aprop", fmt(
        [[ public {} {} {{ get; set; }} ]],
        {
            i(1, "int"),
            i(2, "PropertyName"),
        })),
})
