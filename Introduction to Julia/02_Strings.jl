### A Pluto.jl notebook ###
# v0.18.1

using Markdown
using InteractiveUtils

# ╔═╡ 758581aa-94c4-11ec-2246-71e2b25eed09
md"# 2. Strings

Topics:
1. How to get a string
2. String interpolation
3. String concatenation"

# ╔═╡ fe768696-bedb-433c-896e-0496d95c080a
md"""## How to get a string

Enclose your characters in " " or `{triple quotes}`!"""

# ╔═╡ da81c7bb-6e1f-440f-af08-158058c91edc
s1 = "I am a string."

# ╔═╡ ae7f6287-498c-4150-81b5-e0576202aed7
s2 = """I am also a string. """

# ╔═╡ 9be9c130-be19-4c5c-a139-c79a63f0fc46
md"There are a couple functional differences between strings enclosed in single and triple quotes. One difference is that, in the latter case, you can use quotation marks within your string."

# ╔═╡ 0d7c1203-f16e-4d45-a571-2a305a763084
"Here, we get an "error" because it's ambiguous where this string ends "

# ╔═╡ f17220f4-da42-4a64-99c4-30c3b32e1a2e
"""Look, Mom, no "errors"!!! """

# ╔═╡ a9fb0985-3e84-4c2e-be8e-4ec7987006bc
md"Note that ' ' define a character, but NOT a string!"

# ╔═╡ cd3ee84c-077c-4dd5-a303-362e014686d8
typeof('a')

# ╔═╡ abb74228-a8aa-467a-b3a9-49c940da4d6b
'We will get an error here'

# ╔═╡ 30b9dea3-f2af-44d7-9fb8-e60730cb7a4f
md"## String interpolation

We can use the $ sign to insert existing variables into a string and to evaluate expressions within a string. Below is an example that contains some highly sensitive personal information."

# ╔═╡ 3c0d0a64-f089-4fda-9dc9-6cb2df8ea9ef
begin
	name = "Jane"
	num_fingers = 10
	num_toes = 10
end

# ╔═╡ 3330418b-24bc-41a3-9a1b-0e9dc822e182
"Hello, my name is $name."

# ╔═╡ 3d88a260-de61-478c-b9ee-90edb614be50
"I have $num_fingers fingers and $num_toes toes."

# ╔═╡ 954d46a4-16c4-446f-bd19-2a3371fd06cc
"That is $(num_fingers + num_toes) digits in all!!"

# ╔═╡ 41e4410f-25c4-4db1-8463-fcf63a06a67d
md"## String concatenation

Below are three ways we can concatenate strings!

The first way is to use the `string()` function.
`string()` converts non-string inputs to strings."

# ╔═╡ 33bc7120-3fb0-43f2-8269-fe5e6c6c3c7c
begin
	s3 = "How many cats ";
	s4 = "is too many cats?";
	😺 = 10
end

# ╔═╡ 61d76781-5f98-453a-bc5c-a16fa8dc155e
string(s3, s4)

# ╔═╡ 2bd52ba7-b954-434b-851b-589c40051540
string("I don't know, but ", 😺, " is too few.")

# ╔═╡ 300e308e-be1f-47cc-b102-308b93a61052
md"We can also use `*` for concatenation! (note that this is differeent than in python, where `+` is used for concatenation)"

# ╔═╡ 594b66d6-07c1-45c7-801a-b06cdf21f4ca
s3*s4

# ╔═╡ 69e0ec50-8f40-4691-bdaa-4cf90b8c4015
md"""### Exercises

#### 2.1 
Create a string that says "hi" 1000 times, first with `repeat` and then with the exponentiation operator, which can call `*` under the hood."""

# ╔═╡ bf172a9f-b3af-43cb-aa36-e8d5fb4ae0da
repeat("hi", 1000)

# ╔═╡ 18fdce79-0c93-41a3-8cfd-cedff37a44e7
typeof(repeat("hi", 1000))

# ╔═╡ 4b02b70b-2feb-4f49-a839-7a21894ddcdc
md"""#### 2.2 
Declare two variables

```julia
a = 3
b = 4
```
and use them to create two strings:
```julia
"3 + 4"
"7"
```"""

# ╔═╡ 43bd1eba-c897-4ddc-b5f9-45f536cb05ec
begin
	a = 3
	b = 4
end

# ╔═╡ 3d6f420f-4b91-4dc7-ad2a-caa3b9922282
string(a, "+", b)

# ╔═╡ a5a9c975-c42d-4e5b-9746-1e2f28ed7d2e
"$(a+b)"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─758581aa-94c4-11ec-2246-71e2b25eed09
# ╟─fe768696-bedb-433c-896e-0496d95c080a
# ╠═da81c7bb-6e1f-440f-af08-158058c91edc
# ╠═ae7f6287-498c-4150-81b5-e0576202aed7
# ╟─9be9c130-be19-4c5c-a139-c79a63f0fc46
# ╠═0d7c1203-f16e-4d45-a571-2a305a763084
# ╠═f17220f4-da42-4a64-99c4-30c3b32e1a2e
# ╟─a9fb0985-3e84-4c2e-be8e-4ec7987006bc
# ╠═cd3ee84c-077c-4dd5-a303-362e014686d8
# ╠═abb74228-a8aa-467a-b3a9-49c940da4d6b
# ╟─30b9dea3-f2af-44d7-9fb8-e60730cb7a4f
# ╠═3c0d0a64-f089-4fda-9dc9-6cb2df8ea9ef
# ╠═3330418b-24bc-41a3-9a1b-0e9dc822e182
# ╠═3d88a260-de61-478c-b9ee-90edb614be50
# ╠═954d46a4-16c4-446f-bd19-2a3371fd06cc
# ╟─41e4410f-25c4-4db1-8463-fcf63a06a67d
# ╠═33bc7120-3fb0-43f2-8269-fe5e6c6c3c7c
# ╠═61d76781-5f98-453a-bc5c-a16fa8dc155e
# ╠═2bd52ba7-b954-434b-851b-589c40051540
# ╟─300e308e-be1f-47cc-b102-308b93a61052
# ╠═594b66d6-07c1-45c7-801a-b06cdf21f4ca
# ╟─69e0ec50-8f40-4691-bdaa-4cf90b8c4015
# ╠═bf172a9f-b3af-43cb-aa36-e8d5fb4ae0da
# ╠═18fdce79-0c93-41a3-8cfd-cedff37a44e7
# ╠═4b02b70b-2feb-4f49-a839-7a21894ddcdc
# ╠═43bd1eba-c897-4ddc-b5f9-45f536cb05ec
# ╠═3d6f420f-4b91-4dc7-ad2a-caa3b9922282
# ╠═a5a9c975-c42d-4e5b-9746-1e2f28ed7d2e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
