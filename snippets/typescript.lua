local ls  = require("luasnip")
local s   = ls.snippet
local t   = ls.text_node
local i   = ls.insert_node
local fn  = ls.function_node
local rep = require("luasnip.extras").rep

local function pascal_to_kebab(str)
  -- enlève le suffixe "Component" si présent
  str = str:gsub("Component$", "")
  -- séparations classiques : lower->Upper et acronymes UpperUpperLower
  str = str:gsub("(%l)(%u)", "%1-%2")
  str = str:gsub("(%u)(%u%l)", "%1-%2")
  return "./" .. str:lower() .. ".component"
end

return {
  s("describe", {
    t("import { ComponentFixture, TestBed } from '@angular/core/testing';"),
    t({"", "import { "}), i(1, "MyAwesomeComponent"), t(" } from '"),
    fn(function(args) return pascal_to_kebab(args[1][1]) end, {1}), t("';"),

    t({"", "", "describe('"}), rep(1), t("', () => {"),
    t({"", "  let fixture: ComponentFixture<"}), rep(1), t(">;"),
    t({"", "  let component: "}), rep(1), t(";", ""),

    t({"", "  beforeEach(async () => {"}),
    t({"", "    TestBed.configureTestingModule({"}),
    t({"", "      imports: ["}), rep(1), t("],"),
    t({"", "      providers: [],"}),
    t({"", "    });"}),
    t({"", "    fixture = TestBed.createComponent("}), rep(1), t(");"),
    t({"", "    component = fixture.componentInstance;"}),
    t({"", "  });", ""}),

    t({"", "  it('should create', () => {"}),
    t({"", "    expect(component).toBeTruthy();"}),
    t({"", "  });", ""}),
    t("});"),
  }),
}

