### A Pluto.jl notebook ###
# v0.18.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ e97febb3-d923-467d-b498-213cfe508bb8
begin
	using PlutoUI
	@bind num_disks Slider(1:10, default = 8, show_value=true)
end

# ╔═╡ 5b2ee40e-a2b8-11ea-0fef-c35fe6918860
md"""
# The tower of Hanoi

The tower of hanoi is a famous puzzle.

![setup of the tower of a hanoi](https://upload.wikimedia.org/wikipedia/commons/0/07/Tower_of_Hanoi.jpeg)

The game consists of three rods with disks stacked on top of them. The puzzle will start with all disks in a stack on one of the rods (like in the picture). The goal is to move all the discs to a single stack on the last rod.

To move the disks, you have to follow the following rules:

* You can move only one disk at a time.
* For each move, you have to take the upper disk from one of the stacks, and place it on top of another stack or empty rod.
* You cannot place a larger disk on top of a smaller disk.

This notebook will define a Julia implementation of the puzzle. It's up to you to write an algorithm that solves it.
"""

# ╔═╡ 95fbd0d2-a2b9-11ea-0682-fdf783251797
md"""
## Setting up the game pieces

What does a Julia implementation look like? We're not really interested in writing code that will manipulate physical disks. Our final goal is a function that will give us a _recipe_ to solve the tower of hanoi, which is just a list of moves to make. Because of that, we can use a lot of abstraction in our implementation, and keep the data structures as simple as possible.

To start, we have to define some representation of the disks and the stacks. The disks have one important property, which is that they are ordered. We can use integers to represent them.
"""

# ╔═╡ 620d6834-a2ba-11ea-150a-2132bb54e4b3
num_disks

# ╔═╡ 35ada214-a32c-11ea-0da3-d5d494b28467
md"""(Side note: the number of disks is arbitrary. When testing your function, you may want to set it to 1 or 2 to start.)"""

# ╔═╡ 7243cc8e-a2ba-11ea-3f29-99356f0cdcf4
all_disks = 1:num_disks # this is an iterable from 1 to 8 (step size = 1)

# ╔═╡ 7e1ba2ac-a2ba-11ea-0134-2f61ed75be18
md"""
A single stack can be represented as an array with all the disks in it. We will list them from top to bottom. That is, the first element of our vector is the top of the tower with the smallest disk. The larger the number, the larger the disk.
"""

# ╔═╡ 43781a52-a339-11ea-3803-e56e2d08aa83
first_stack = collect(all_disks)

# ╔═╡ b648ab70-a2ba-11ea-2dcc-55b630e44325
md"""
Now we have to make three of those. 
"""

# ╔═╡ 32f26f80-a2bb-11ea-0f2a-3fc631ada63d
starting_stacks = [first_stack, [], []] # vector of vectors

# ╔═╡ e347f1de-a2bb-11ea-06e7-87cca6f2a240
md"""
## Defining the rules

Now that we have our "game board", we can implement the rules.

To start, we make two functions for states. A state of the game is just an array of stacks.

We will define a function that checks if a state is okay according to the rules. To be legal, all the stacks should be in the correct order, so no larger disks on top of smaller disks. 

Another good thing to check: no disks should have appeared or disappeared since we started!
"""

# ╔═╡ 512fa6d2-a2bd-11ea-3dbe-b935b536967b
function islegal(stacks)
	order_correct = all(issorted, stacks) # returns true if order is increasing
	
	#check if we use the same disk set that we started with
	
	disks_in_state = sort([disk for stack in stacks for disk in stack])
	disks_complete = (disks_in_state == all_disks)
	
	order_correct && disks_complete # will return true if both are true
end

# ╔═╡ c56a5858-a2bd-11ea-1d96-77eaf5e74925
md"""
Another function for states: check if we are done! We can assume that we already checked if the state was legal. So we know that all the disks are there and they are ordered correctly.  To check if we are finished, we just need to check if the last stack contains all the disks.
"""

# ╔═╡ d5cc41e8-a2bd-11ea-39c7-b7df8de6ae3e
function iscomplete(stacks)
	last(stacks) == all_disks
end

# ╔═╡ 53374f0e-a2c0-11ea-0c91-97474780721e
md"""
Now the only rules left to implement are the rules for moving disks. 

We could implement this as another check on states, but it's easier to just write a legal `move` function. Your solution will specify moves for the `move` function, so this will be the only way that the stacks are actually manipulated. That way, we are sure that nothing fishy is happening.

We will make our `move` function so that its input consists of a state of the game, and instructions for what to do. Its output will be the new state of the game.

So what should those instructions look like? It may seem intuitive to give a _disk_ that should be moved, but that's more than we need. After all, we are only allowed to take the top disk from one stack, and move it to the top of another. So we only have to say which _stacks_ we are moving between.

(Note that the `move` function is okay with moving a larger disk on top of a smaller disk. We already implemented that restriction in `islegal`.)
"""

# ╔═╡ e915394e-a2c0-11ea-0cd9-1df6fd3c7adf
function move(stacks, source::Int, target::Int)
	#check if the from stack if not empty
	if isempty(stacks[source])
		error("Error: attempted to move disk from empty stack")
	end
	
	new_stacks = deepcopy(stacks)
	
	disk = popfirst!(new_stacks[source]) #take disk
	pushfirst!(new_stacks[target], disk) #put on new stack
	
	return new_stacks
end

# ╔═╡ 87b2d164-a2c4-11ea-3095-916628943879
md"""
## Solving the problem

We have implemented the game pieces and the rules, so you can start working on your solution.

To do this, you can fill in the `solve(stacks)` function. This function should give a solution for the given `stacks`, by moving all the disks from stack 1 to stack 3.

As output, `solve` should give a recipe, that tells us what to do. This recipe should be an array of moves. Each moves is a `(source, target)` tuple, specifying from which stack to which stack you should move.

For example, it might look like this:
"""

# ╔═╡ 29b410cc-a329-11ea-202a-795b31ce5ad5
function wrong_solution(stacks)::Array{Tuple{Int, Int}}
	return [(1,2), (2,3), (2,1), (1,3)]
end

# ╔═╡ ea24e778-a32e-11ea-3f11-dbe9d36b1011
md"""
Now you can work on building an actual solution. Some tips:
* `solve(stacks)` can keep track of the board if you want, but it doesn't have to.
* The section below will actually run your moves, which is very useful for checking them.
* If you want, you can change `num_disks` to 1 or 2. That can be a good starting point.
"""

# ╔═╡ 010dbdbc-a2c5-11ea-34c3-837eae17416f
function solve(start = starting_stacks)::Array{Tuple{Int, Int}}

	num_disks = length(starting_stacks[1])

	for 1:2^num_disks - 1
	
	if num_disks % 2 == 0 # even condition 
		
	else # odd condition
	end
	
	return moves
end

# ╔═╡ fb108380-7d3f-4d18-94a0-76b391f4828f
4 % 2 == 0

# ╔═╡ 3eb3c4c0-a2c5-11ea-0bcc-c9b52094f660
md"""
## Checking solutions

This is where we can check a solution. We start with a function that takes our recipe and runs it.
"""

# ╔═╡ 4709db36-a327-11ea-13a3-bbfb18da84ce
function run_solution(solver::Function, start = starting_stacks)
	moves = solver(deepcopy(start)) #apply the solver
	
	all_states = Array{Any,1}(undef, length(moves) + 1)
	all_states[1] = start
	
	for (i, m) in enumerate(moves)
		try
			all_states[i + 1] = move(all_states[i], m[1], m[2])
		catch
			all_states[i + 1] = missing
		end
	end
	
	return all_states
end

# ╔═╡ 372824b4-a330-11ea-2f26-7b9a1ad018f1
md"""
You can use this function to see what your solution does.

If `run_solution` tries to make an impossible move, it will give `missing` from that point onwards. Look at what happens in the `wrong_solution` version and compare it to the moves in `wrong_solution`.
"""

# ╔═╡ d2227b40-a329-11ea-105c-b585d5fcf970
run_solution(wrong_solution)

# ╔═╡ 9173b174-a327-11ea-3a69-9f7525f2e7b4
run_solution(solve)

# ╔═╡ bb5088ec-a330-11ea-2c41-6b8b92724b3b
md"""
Now that we have way to run a recipe, we can check if its output is correct. We will check if all the intermediate states are legal and the final state is the finished puzzle.
"""

# ╔═╡ 10fb1c56-a2c5-11ea-2a06-0d8c36bfa138
function check_solution(solver::Function, start = starting_stacks)
	try
		#run the solution
		all_states = run_solution(solver, start)
		
		#check if each state is legal
		all_legal = all(islegal, all_states)
		
		#check if the final state is is the completed puzzle
		complete = (iscomplete ∘ last)(all_states)
		
		all_legal && complete
	catch
		#return false if we encountered an error
		return false
	end
end

# ╔═╡ 8ea7f944-a329-11ea-22cc-4dbd11ec0610
check_solution(solve)

# ╔═╡ e54add0a-a330-11ea-2eeb-1d42f552ba38
if check_solution(solve)
	if num_disks >= 8
		md"""
		#### Congratulations, your solution works! 😎
		"""
	else
		md"""
		Your solution works for $(num_disks) disks. Change `num_disks` to see if it works for 8 or more.
		"""
	end
else
	md"""
	The `solve` function doesn't work yet. Keep working on it!
	"""
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.35"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "13468f237353112a01b2d6b32f3d0f80219944aa"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "85bf3e4bd279e405f91489ce518dedb1e32119cb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.35"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─5b2ee40e-a2b8-11ea-0fef-c35fe6918860
# ╟─95fbd0d2-a2b9-11ea-0682-fdf783251797
# ╠═e97febb3-d923-467d-b498-213cfe508bb8
# ╠═620d6834-a2ba-11ea-150a-2132bb54e4b3
# ╟─35ada214-a32c-11ea-0da3-d5d494b28467
# ╠═7243cc8e-a2ba-11ea-3f29-99356f0cdcf4
# ╟─7e1ba2ac-a2ba-11ea-0134-2f61ed75be18
# ╠═43781a52-a339-11ea-3803-e56e2d08aa83
# ╟─b648ab70-a2ba-11ea-2dcc-55b630e44325
# ╠═32f26f80-a2bb-11ea-0f2a-3fc631ada63d
# ╟─e347f1de-a2bb-11ea-06e7-87cca6f2a240
# ╠═512fa6d2-a2bd-11ea-3dbe-b935b536967b
# ╟─c56a5858-a2bd-11ea-1d96-77eaf5e74925
# ╠═d5cc41e8-a2bd-11ea-39c7-b7df8de6ae3e
# ╟─53374f0e-a2c0-11ea-0c91-97474780721e
# ╠═e915394e-a2c0-11ea-0cd9-1df6fd3c7adf
# ╟─87b2d164-a2c4-11ea-3095-916628943879
# ╠═29b410cc-a329-11ea-202a-795b31ce5ad5
# ╟─ea24e778-a32e-11ea-3f11-dbe9d36b1011
# ╠═010dbdbc-a2c5-11ea-34c3-837eae17416f
# ╠═fb108380-7d3f-4d18-94a0-76b391f4828f
# ╟─3eb3c4c0-a2c5-11ea-0bcc-c9b52094f660
# ╠═4709db36-a327-11ea-13a3-bbfb18da84ce
# ╟─372824b4-a330-11ea-2f26-7b9a1ad018f1
# ╠═d2227b40-a329-11ea-105c-b585d5fcf970
# ╠═9173b174-a327-11ea-3a69-9f7525f2e7b4
# ╟─bb5088ec-a330-11ea-2c41-6b8b92724b3b
# ╠═10fb1c56-a2c5-11ea-2a06-0d8c36bfa138
# ╠═8ea7f944-a329-11ea-22cc-4dbd11ec0610
# ╟─e54add0a-a330-11ea-2eeb-1d42f552ba38
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
