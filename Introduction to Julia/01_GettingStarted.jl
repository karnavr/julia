### A Pluto.jl notebook ###
# v0.18.1

using Markdown
using InteractiveUtils

# ╔═╡ 2455fa9f-e7e8-45c6-b12c-7421b701aa7f
md"**Note:** This series of tutorials was originally created by [Jane Herriman](https://twitter.com/janeherriman). I originally found them via an [intro to Julia tutorial](https://www.youtube.com/watch?v=8h8rQyEpiZA) and retrieved the files from Jane's [github repo](https://github.com/xorJane/Introduction_to_Julia_tutorials). 

I am now re-creating them in Pluto notebooks as a way to explore them myself, learn how Pluto works, and add some of my own notes along the way :)"

# ╔═╡ e2ad414c-9464-11ec-07e5-1f13801d8c16
md" # 1. Getting Started

This first notebook covers:
1. How to print
2. How to assign variables
3. How to comment
4. Syntax for basic math

"

# ╔═╡ ff00abce-d999-4541-98ad-3f419195657a
md"## How to print

In Julia we usually use `println()` to print. Because i'm using a Pluto notebook, using `println()` will print to the Julia REPL. See [this](https://github.com/fonsp/Pluto.jl/wiki/⚡-Writing-and-running-code)"

# ╔═╡ f5413f8e-ce57-4609-bd0d-fb98b48c53c7
display("I'm excited to learn Julia!")

# ╔═╡ 944e23cb-6faf-41f1-a998-44eac40d474f
md"In Pluto, we instead want to do this:"

# ╔═╡ 9b0778be-a9ff-46da-8caa-4e6df73e2470
"I'm excited to learn Julia"

# ╔═╡ a3da6342-60a0-436d-bb89-cbd720040a5f
md"I guess this could be useful sometimes when we want to output a result at the very end or something to that effect..."

# ╔═╡ bc2ccbbc-f7b2-4b16-ab46-ee26cbd29606
md"## How to assign variables

All we need is a variable name, value, and an equal's sign! Julia will figure out types for us."

# ╔═╡ 70a35562-342c-4e27-a607-b49dd0e9f9db
begin
	my_answer = 42
	typeof(my_answer)
end

# ╔═╡ 7e636f35-9241-4564-874f-83f4efcce395
begin
	😺 = "smiley cat!"
	😺 = 1
	typeof(😺)
end

# ╔═╡ 97dcc87a-f903-42aa-aa77-18a0b7aee9e4
md"After assigning a value to a variable, we can reassign a value of a different type to that variable without any issue. Pluto doesn't like re-assigning variables (unless it's in the same `begin...end` block) for some reason..."

# ╔═╡ bd16d257-3abe-4d94-b626-b6ce3f9a9d9e
md"Note: Julia allows us to write super generic code, and 😺 is an example of this. 

This allows us to write code like"

# ╔═╡ 461ef7a2-a940-41ad-8462-649d871a2d77
begin
	😀 = 0
	😞 = -1
end

# ╔═╡ ba9c7eff-43bc-459c-b98f-ed4e7cf1cbe1
😺 + 😞 == 😀

# ╔═╡ 70fb918f-e987-4cae-824c-f3720b63367f
md"## How to comment"

# ╔═╡ 6c848161-f641-4266-9da0-755718b9adf6
# You can leave comments on a single line using the pound/hash key

# ╔═╡ f7e83d7f-10b5-4ab4-bfe8-392b7dd77ffc
#=

For multi-line comments, 
use the '#= =#' sequence.

=#

# ╔═╡ b0fa4ff7-4c7a-4f92-abeb-c68a5a2e0ebc
md"## Syntax for basic math"

# ╔═╡ 3500bec8-98d2-4219-a58e-3b011bcd7781
sum = 3 + 7

# ╔═╡ 2f8352cd-41c7-484f-977a-054e0551dc79
difference = 10 - 3

# ╔═╡ b0d164fb-a297-4436-adad-c03229109af5
product = 20 * 5

# ╔═╡ b8c7c589-72d8-4612-8b3a-f536993eb369
quotient = 100 / 10

# ╔═╡ e990dc89-146e-42ed-a54d-9f7fcdd3fb5a
power = 10 ^ 2 # note difference from python

# ╔═╡ 75f7b01b-b2c0-4fef-a3b2-ba61b1a31978
modulus = 101 % 2

# ╔═╡ 1ed661fc-f39b-4ec7-84e3-d8a3c6242ea6
md"### Exercises

#### 1.1 
Look up docs for the `convert` function."

# ╔═╡ 80390a23-1510-47b5-af64-8e52ea15f9b8
convert(Int, 3.0)

# ╔═╡ d72bc3ff-31c9-455c-af43-a65b0f1bed5e
md"#### 1.2 
Assign `365` to a variable named `days`. Convert `days` to a float."

# ╔═╡ 57764278-bca0-4756-ad8d-f27852eb0911
begin
	days = 365
	convert(Float64, days)
end

# ╔═╡ 8ee64ae8-6a85-46b0-89ac-b578030c39e5
md"""#### 1.3 
See what happens when you execute (and then look at docs to understand why)

```julia
convert(Int64, "1")
```
and

```julia
parse(Int64, "1")
```

"""

# ╔═╡ 2f0993aa-2338-4d76-9949-7ab15fb2492a
convert(Int64, "1")

# ╔═╡ f738305a-63f5-44f1-ad5a-098ed8461ced
parse(Int64, "1")

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
# ╟─2455fa9f-e7e8-45c6-b12c-7421b701aa7f
# ╟─e2ad414c-9464-11ec-07e5-1f13801d8c16
# ╟─ff00abce-d999-4541-98ad-3f419195657a
# ╠═f5413f8e-ce57-4609-bd0d-fb98b48c53c7
# ╟─944e23cb-6faf-41f1-a998-44eac40d474f
# ╠═9b0778be-a9ff-46da-8caa-4e6df73e2470
# ╟─a3da6342-60a0-436d-bb89-cbd720040a5f
# ╟─bc2ccbbc-f7b2-4b16-ab46-ee26cbd29606
# ╠═70a35562-342c-4e27-a607-b49dd0e9f9db
# ╠═7e636f35-9241-4564-874f-83f4efcce395
# ╟─97dcc87a-f903-42aa-aa77-18a0b7aee9e4
# ╟─bd16d257-3abe-4d94-b626-b6ce3f9a9d9e
# ╠═461ef7a2-a940-41ad-8462-649d871a2d77
# ╠═ba9c7eff-43bc-459c-b98f-ed4e7cf1cbe1
# ╟─70fb918f-e987-4cae-824c-f3720b63367f
# ╠═6c848161-f641-4266-9da0-755718b9adf6
# ╠═f7e83d7f-10b5-4ab4-bfe8-392b7dd77ffc
# ╟─b0fa4ff7-4c7a-4f92-abeb-c68a5a2e0ebc
# ╠═3500bec8-98d2-4219-a58e-3b011bcd7781
# ╠═2f8352cd-41c7-484f-977a-054e0551dc79
# ╠═b0d164fb-a297-4436-adad-c03229109af5
# ╠═b8c7c589-72d8-4612-8b3a-f536993eb369
# ╠═e990dc89-146e-42ed-a54d-9f7fcdd3fb5a
# ╠═75f7b01b-b2c0-4fef-a3b2-ba61b1a31978
# ╟─1ed661fc-f39b-4ec7-84e3-d8a3c6242ea6
# ╠═80390a23-1510-47b5-af64-8e52ea15f9b8
# ╟─d72bc3ff-31c9-455c-af43-a65b0f1bed5e
# ╠═57764278-bca0-4756-ad8d-f27852eb0911
# ╟─8ee64ae8-6a85-46b0-89ac-b578030c39e5
# ╠═2f0993aa-2338-4d76-9949-7ab15fb2492a
# ╠═f738305a-63f5-44f1-ad5a-098ed8461ced
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
