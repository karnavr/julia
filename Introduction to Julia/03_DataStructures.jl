### A Pluto.jl notebook ###
# v0.18.1

using Markdown
using InteractiveUtils

# ╔═╡ 7348852c-94c6-11ec-3bab-51944ccbfd63
md"# 3. Data structures

Once we start working with many pieces of data at once, it will be convenient for us to store data in structures like arrays or dictionaries (rather than just relying on variables).

Types of data structures covered:
1. Tuples
2. Dictionaries
3. Arrays


As an overview, tuples and arrays are both ordered sequences of elements (so we can index into them). Dictionaries and arrays are both mutable.
We'll explain this more below!"

# ╔═╡ a4137b9f-c81e-4a57-aea4-d5206414c306
md"## Tuples

We can create a tuple by enclosing an ordered collection of elements in `( )`.

Syntax:
```julia
(item1, item2, ...)
```"

# ╔═╡ cf79fe40-7785-4113-8827-d80ea9984b2e
myfavoriteanimals = ("penguins", "cats", "sugargliders")

# ╔═╡ b1964172-9848-4175-975d-3f40be2e161e
md"We can index into this tuple,"

# ╔═╡ 9eb9ac7e-86eb-46c0-867f-f73c803c134d
myfavoriteanimals[1]

# ╔═╡ 74f1338d-d069-415f-8752-bfca654e4c30
md"but since tuples are immutable, we can't update it"

# ╔═╡ c1db88df-fa3e-48a0-b519-1e0a75578440
myfavoriteanimals[1] = "otters"

# ╔═╡ 7aa146f4-039c-4c3d-99db-29cc3f40cc7e
md"## Now in 1.0: NamedTuples

As you might guess, `NamedTuple`s are just like `Tuple`s except that each element additionally has a name! They have a special syntax using `=` inside a tuple:

```julia
(name1 = item1, name2 = item2, ...)
```"

# ╔═╡ 049d760f-7a87-4980-bd00-372d3870a9a5
mynewfavoriteanimals = (bird = "penguins", mammal = "cats", marsupial = "sugargliders")

# ╔═╡ ab58098f-690b-4b8e-9dee-212f9a170b84
md"Like regular `Tuples`, `NamedTuples` are ordered, so we can retrieve their elements via indexing:"

# ╔═╡ b5334d2c-0e79-44e2-b185-45dd92028148
mynewfavoriteanimals[1]

# ╔═╡ aa703d19-19ed-47e1-b87e-0f3c34d6c6a2
md"They also add the special ability to access values by their name:"

# ╔═╡ f43f7085-9ef1-4507-9631-50bb0c7247e9
mynewfavoriteanimals.bird

# ╔═╡ 34bf1024-58e7-4341-8343-e0e29fbd9094
md"## Dictionaries

If we have sets of data related to one another, we may choose to store that data in a dictionary. We can create a dictionary using the `Dict()` function, which we can initialize as an empty dictionary or one storing key, value pairs.

Syntax:
```julia
Dict(key1 => value1, key2 => value2, ...)
```

A good example is a contacts list, where we associate names with phone numbers."

# ╔═╡ 218d1f47-1d19-4461-9440-1b09d55a72ea
myphonebook = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

# ╔═╡ d6f9334d-fddd-428c-962b-e5e1aebdde69
md"""In this example, each name and number is a "key" and "value" pair. We can grab Jenny's number (a value) using the associated key"""

# ╔═╡ cbc98cf1-b4ba-4c25-a741-6dc86698169f
myphonebook["Jenny"]

# ╔═╡ 3456a14f-56ba-44f0-8b50-1731d11ba8cf
md"We can add another entry to this dictionary as follows"

# ╔═╡ 43b384fe-c25c-4d0d-b41c-8d531be46969
myphonebook["Kramer"] = "555-FILK"

# ╔═╡ 5be61b7a-92a8-4f8f-8cdd-3d5288b77ab6
md"Let's check what our phonebook looks like now..."

# ╔═╡ 40a023ef-2a2a-40b2-a755-4d34acc9e673
myphonebook

# ╔═╡ 870ee5a0-caa2-4cf5-9c66-62aecb54eb86
md"We can delete Kramer from our contact list - and simultaneously grab his number - by using `pop!`"

# ╔═╡ 117ba5ea-d336-4ba0-b94c-556f5e21b65b
pop!(myphonebook, "Kramer")

# ╔═╡ e0079dce-6b88-455d-9fd8-8a4fbcf73cfa
myphonebook

# ╔═╡ f2adc1d9-caab-4eaa-b5d7-d4f7e6b08af4
md"Unlike tuples and arrays, dictionaries are not ordered. So, we can't index into them."

# ╔═╡ f443c939-050b-4b04-acd2-9ab7a76494a9
myphonebook[1]

# ╔═╡ 14e32f97-9426-43f7-9498-28ee5e998486
md"In the example above, `julia` thinks you're trying to access a value associated with the key `1`."

# ╔═╡ 807ffdd8-5da1-4b08-b2e3-562905f6d3d1
md"""## Arrays

Unlike tuples, arrays are mutable. Unlike dictionaries, arrays contain ordered collections. <br>
We can create an array by enclosing this collection in `[ ]`.

Syntax:
```julia
[item1, item2, ...]
```


For example, we might create an array to keep track of my friends"""

# ╔═╡ 6741e3f3-3cf1-41ee-b35e-a3dfb7f4348b
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

# ╔═╡ d2f26f56-eea1-417f-9634-57b9403eb16e
md"""The `1` in `Array{String,1}` means this is a one dimensional vector.  An `Array{String,2}` would be a 2d matrix, etc.  The `String` is the type of each element. Note that I believe that `Julia`'s output isn't as verbose anymore (now running `Julia 1.7.2` and this tutorial was created for `Julia 1.0` in 2018)

or to store a sequence of numbers

"""

# ╔═╡ 47825d41-e3f6-4b2c-a6eb-dfb1688555b1
fibonacci = [1, 1, 2, 3, 5, 8, 13]

# ╔═╡ 9b6ddfd1-9b5d-482a-ac83-fc134c071f0e
mixture = [1, 1, 2, 3, "Ted", "Robyn"]

# ╔═╡ 5c1d23d7-b218-467b-97b5-e36881090bcd
md"Once we have an array, we can grab individual pieces of data from inside that array by indexing into the array. For example, if we want the third friend listed in `myfriends`, we write"

# ╔═╡ af548695-8fde-46fc-aa24-33283312352c
myfriends[3]

# ╔═╡ 24966279-5460-4307-a484-1349d9c57073
md"We can use indexing to edit an existing element of an array"

# ╔═╡ 95692e1d-5082-4c10-9f32-de5ce85ceca9
myfriends[3] = "Baby Bop"

# ╔═╡ 3b80fcf4-6b30-4fad-97ec-d0a3a3c8f7c1
md"Yes, Julia is 1-based indexing, not 0-based like Python.  Wars are faught over lesser issues. I have a friend with the wisdom of Solomon who proposes settling this once and for all with ½ 😃

We can also edit the array by using the `push!` and `pop!` functions. `push!` adds an element to the end of an array and `pop!` removes the last element of an array.

We can add another number to our fibonnaci sequence
"

# ╔═╡ b185bcb3-ef4e-4324-8f48-a42d23d80189
push!(fibonacci, 21)

# ╔═╡ bdf91ba6-160a-44e2-905f-2df53ea0c340
pop!(fibonacci)

# ╔═╡ 57a3b67a-39d3-4d87-a3ef-6642b92225b9
fibonacci

# ╔═╡ 7ddfc1cb-7330-4380-91e8-31da0da70521
md"So far I've given examples of only 1D arrays of scalars, but arrays can have an arbitrary number of dimensions and can also store other arrays. 

For example, the following are arrays of arrays:"

# ╔═╡ ddf6f8ff-991c-4658-872f-aa13599940a5
favorites = [["koobideh", "chocolate", "eggs"],["penguins", "cats", "sugargliders"]]

# ╔═╡ 50312222-73be-4dc8-b002-c131fb4791fb
numbers = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]

# ╔═╡ ee7d1669-c149-4e86-bad3-b7230e4fd27b
md"Below are examples of 2D and 3D arrays populated with random values."

# ╔═╡ 032bdcd9-c9e3-498d-8871-589d7bc35998
rand(4, 3)

# ╔═╡ dd193390-fe27-45b6-b02c-de9450673a00
rand(4, 3, 2)

# ╔═╡ 9fc303eb-bc05-46f6-a200-ac5d430ff5b7
md"Be careful when you want to copy arrays!"

# ╔═╡ 78e60d75-4d08-4da4-bab6-c72ab61530bf
fibonacci

# ╔═╡ b7239fcf-18e8-4aec-b5ef-eaed0bf33670
somenumbers = fibonacci

# ╔═╡ 975396c2-a521-4151-a16f-64166ad74773
somenumbers[1] = 404

# ╔═╡ 4cc67189-65d8-4451-afc5-7addae9c0b63
fibonacci

# ╔═╡ 75c4578d-0feb-4b08-a9a0-88cca943601a
md"Editing `somenumbers` caused `fibonacci` to get updated as well!

In the above example, we didn't actually make a copy of `fibonacci`. We just created a new way to access the entries in the array bound to `fibonacci`.

If we'd like to make a copy of the array bound to `fibonacci`, we can use the `copy` function."

# ╔═╡ 4e9a8421-3a26-49dd-90a9-ad87fca676db
begin
	# First, restore fibonacci
	fibonacci[1] = 1
	fibonacci
end

# ╔═╡ 8f355722-c7a5-4058-bb75-2971f321b82f
somemorenumbers = copy(fibonacci)

# ╔═╡ 05a5138d-fcf2-4ad9-b7c2-bffbf9938b9c
somemorenumbers[1] = 404

# ╔═╡ 5dc51316-9c56-423c-bc8a-0e08f2bf671d
fibonacci

# ╔═╡ 28fe38e8-e991-463b-82ad-9442c6ffb2d7
md"In this last example, fibonacci was not updated. Therefore we see that the arrays bound to `somemorenumbers` and `fibonacci` are distinct."

# ╔═╡ 41dca4eb-b428-4685-9b2c-8f7ad6d394d0
md"""### Exercises

#### 3.1 
Create an array, `a_ray`, with the following code:

```julia
a_ray = [1, 2, 3]
```

Add the number `4` to the end of this array and then remove it."""

# ╔═╡ 35863db5-117f-455f-9173-cdd6bbcaed02
begin
	a_ray = [1, 2, 3]
	push!(a_ray, 4)
end

# ╔═╡ 9759499b-00e4-43b5-b212-421a216e8dbc
pop!(a_ray)

# ╔═╡ 4dd20848-8b0f-4294-8ccb-3acaec0152b0
a_ray

# ╔═╡ 98b2ec52-6763-49c6-b4bb-f7e587a21757
md"(need to add/do other examples)"

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
# ╟─7348852c-94c6-11ec-3bab-51944ccbfd63
# ╟─a4137b9f-c81e-4a57-aea4-d5206414c306
# ╠═cf79fe40-7785-4113-8827-d80ea9984b2e
# ╟─b1964172-9848-4175-975d-3f40be2e161e
# ╠═9eb9ac7e-86eb-46c0-867f-f73c803c134d
# ╟─74f1338d-d069-415f-8752-bfca654e4c30
# ╠═c1db88df-fa3e-48a0-b519-1e0a75578440
# ╟─7aa146f4-039c-4c3d-99db-29cc3f40cc7e
# ╠═049d760f-7a87-4980-bd00-372d3870a9a5
# ╟─ab58098f-690b-4b8e-9dee-212f9a170b84
# ╠═b5334d2c-0e79-44e2-b185-45dd92028148
# ╟─aa703d19-19ed-47e1-b87e-0f3c34d6c6a2
# ╠═f43f7085-9ef1-4507-9631-50bb0c7247e9
# ╟─34bf1024-58e7-4341-8343-e0e29fbd9094
# ╠═218d1f47-1d19-4461-9440-1b09d55a72ea
# ╟─d6f9334d-fddd-428c-962b-e5e1aebdde69
# ╠═cbc98cf1-b4ba-4c25-a741-6dc86698169f
# ╟─3456a14f-56ba-44f0-8b50-1731d11ba8cf
# ╠═43b384fe-c25c-4d0d-b41c-8d531be46969
# ╟─5be61b7a-92a8-4f8f-8cdd-3d5288b77ab6
# ╠═40a023ef-2a2a-40b2-a755-4d34acc9e673
# ╟─870ee5a0-caa2-4cf5-9c66-62aecb54eb86
# ╠═117ba5ea-d336-4ba0-b94c-556f5e21b65b
# ╠═e0079dce-6b88-455d-9fd8-8a4fbcf73cfa
# ╟─f2adc1d9-caab-4eaa-b5d7-d4f7e6b08af4
# ╠═f443c939-050b-4b04-acd2-9ab7a76494a9
# ╟─14e32f97-9426-43f7-9498-28ee5e998486
# ╟─807ffdd8-5da1-4b08-b2e3-562905f6d3d1
# ╠═6741e3f3-3cf1-41ee-b35e-a3dfb7f4348b
# ╟─d2f26f56-eea1-417f-9634-57b9403eb16e
# ╠═47825d41-e3f6-4b2c-a6eb-dfb1688555b1
# ╠═9b6ddfd1-9b5d-482a-ac83-fc134c071f0e
# ╟─5c1d23d7-b218-467b-97b5-e36881090bcd
# ╠═af548695-8fde-46fc-aa24-33283312352c
# ╟─24966279-5460-4307-a484-1349d9c57073
# ╠═95692e1d-5082-4c10-9f32-de5ce85ceca9
# ╟─3b80fcf4-6b30-4fad-97ec-d0a3a3c8f7c1
# ╠═b185bcb3-ef4e-4324-8f48-a42d23d80189
# ╠═bdf91ba6-160a-44e2-905f-2df53ea0c340
# ╠═57a3b67a-39d3-4d87-a3ef-6642b92225b9
# ╟─7ddfc1cb-7330-4380-91e8-31da0da70521
# ╠═ddf6f8ff-991c-4658-872f-aa13599940a5
# ╠═50312222-73be-4dc8-b002-c131fb4791fb
# ╟─ee7d1669-c149-4e86-bad3-b7230e4fd27b
# ╠═032bdcd9-c9e3-498d-8871-589d7bc35998
# ╠═dd193390-fe27-45b6-b02c-de9450673a00
# ╟─9fc303eb-bc05-46f6-a200-ac5d430ff5b7
# ╠═78e60d75-4d08-4da4-bab6-c72ab61530bf
# ╠═b7239fcf-18e8-4aec-b5ef-eaed0bf33670
# ╠═975396c2-a521-4151-a16f-64166ad74773
# ╠═4cc67189-65d8-4451-afc5-7addae9c0b63
# ╟─75c4578d-0feb-4b08-a9a0-88cca943601a
# ╠═4e9a8421-3a26-49dd-90a9-ad87fca676db
# ╠═8f355722-c7a5-4058-bb75-2971f321b82f
# ╠═05a5138d-fcf2-4ad9-b7c2-bffbf9938b9c
# ╠═5dc51316-9c56-423c-bc8a-0e08f2bf671d
# ╟─28fe38e8-e991-463b-82ad-9442c6ffb2d7
# ╟─41dca4eb-b428-4685-9b2c-8f7ad6d394d0
# ╠═35863db5-117f-455f-9173-cdd6bbcaed02
# ╠═9759499b-00e4-43b5-b212-421a216e8dbc
# ╠═4dd20848-8b0f-4294-8ccb-3acaec0152b0
# ╟─98b2ec52-6763-49c6-b4bb-f7e587a21757
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
