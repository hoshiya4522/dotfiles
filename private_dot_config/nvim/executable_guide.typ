#set page(paper: "a4", margin: 1.2in)
#set text(font: "Linux Libertine", size: 12pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.")

// --- TITLE PAGE ---
#align(center)[
  #v(2in)
  #text(size: 28pt, weight: "bold")[The Neovim Handbook]
  #v(1em)
  #text(size: 16pt)[A Complete Tutorial & Reference Guide]
  #v(4in)
  #text(size: 12pt)[Your custom development and writing environment.]
]
#pagebreak()

// --- TABLE OF CONTENTS ---
#outline(title: "Table of Contents")
#pagebreak()

// --- CHAPTER 1 ---
= Getting Started & The Basics

Welcome to your Neovim environment. This setup is designed to be lightweight but powerful, using a direct package-loading method (`vim.pack.add`) instead of heavy plugin managers. 

== The Leader Key
The most important key in your setup is the **Leader Key**. It acts like a custom modifier (like `Ctrl` or `Alt`).
- **Your Leader Key is:** `<Space>`
Whenever you see `<Space>` in this guide, just tap the spacebar once before pressing the next key.

== Visuals and Formatting
- **Theme:** `tokyonight` gives a clean, dark background that is easy on the eyes during long study sessions.
- **Line Numbers:** You have "relative" line numbers enabled. The line you are on shows its actual number, but the lines above and below show how far away they are (1, 2, 3...). This makes jumping around with `5j` or `3k` very easy.
- **Spacing:** Pressing `Tab` inserts 4 spaces.
- **Word Wrap:** Long lines of text will wrap to the next line without breaking words in the middle, which is perfect for writing paragraphs.

#pagebreak()

// --- CHAPTER 2 ---
= Moving Around Your Projects

Managing files and finding text quickly is crucial when jumping between code files and notes. 

== 1. Telescope: The Search Engine
Telescope is a fuzzy finder. You do not need to type exact names; just type a few letters, and it will find what you need.
- `<Space> ff` : **Find Files.** Opens a list of all files in your folder.
- `<Space> fg` : **Live Grep.** Searches for specific text *inside* all your files.
- `<Space> fb` (or `<Space> <Space>`) : **Find Buffers.** Quickly switch to a file you already have open.

== 2. Harpoon: Fast File Switching
When you are working on a project, you usually only care about 2 or 3 files at a time (for example, a `main.cpp` and a `header.h`). Harpoon lets you "bookmark" these files and jump between them instantly without searching.
- `<Space> a` : **Add** the current file to your Harpoon list.
- `<Space> h` : Jump to the **1st** file in your list.
- `<Space> j` : Jump to the **2nd** file in your list.
- `<Space> k` : Jump to the **3rd** file in your list.
- `Ctrl + e` : Open a small window to see and manage your Harpoon list.

== 3. Oil: Editing Folders Like Text
Instead of a traditional sidebar file tree, you use **Oil**. 
- `<Space> fo` : **Open Oil.** This opens your current folder as if it were a regular text file. You can create, rename, or delete files just by typing and deleting text, then saving (`<Space> S`) to apply the changes.

#pagebreak()

// --- CHAPTER 3 ---
= Writing Code (LSP & Autocomplete)

Your editor uses the Language Server Protocol (LSP). Think of LSP as a smart assistant running in the background. It reads your code and provides error checking, auto-completion, and definitions.

== Supported Languages
Your setup is ready for heavy programming coursework. It automatically loads servers for:
- **C/C++** (`clangd`)
- **Java** (`jdtls`)
- **Python** (`ruff`)
- **Web** (`html`, `cssls`, `ts_ls`)

== Smart Code Navigation
When your cursor is over a function or variable, you can ask LSP about it:
- `grd` : **Go to Definition.** Jumps to where the function or variable was created.
- `grr` : **Go to References.** Shows everywhere that function or variable is used.
- `<Space> rn` : **Rename.** Safely renames a variable across your entire project.
- `<Space> th` : **Toggle Inlay Hints.** Turns on small, ghost-text hints that show parameter names and types.

== Snippets & Auto-Accept
You have `LuaSnip` installed for code snippets (like typing `for` and having it expand into a full loop). 
- Sometimes, snippets expand when you don't want them to. You have a custom toggle!
- `<Space> ta` : **Toggle Snippet Auto-Accept.** Press this to turn the automatic expansion on or off. 
- Use `Ctrl + n` and `Ctrl + p` to move up and down the autocomplete menu, and `Ctrl + y` to confirm your choice.

#pagebreak()

// --- CHAPTER 4 ---
= Engineering Reports (LaTeX & Typst)

For writing math-heavy documents, lab reports, or equations (like Fourier series or Laplace transforms), your setup includes powerful compilation tools.

== VimTeX (For LaTeX)
When you open a `.tex` file, VimTeX takes over.
- It uses `latexmk` to compile your document in the background continuously.
- It saves all the messy build files into the `/tmp` folder, keeping your project folder clean.
- It automatically opens your finished PDF in **Zathura** (a fast, keyboard-driven document viewer).

== Typst (The Modern Alternative)
Typst is faster and simpler than LaTeX. Your setup includes `typst-preview.nvim`, which uses the `tinymist` language server.
- `<Space> tp` : **Toggle Typst Preview.** This will open a live-updating preview of your Typst document. As you type, the PDF updates almost instantly.

#pagebreak()

// --- CHAPTER 5 ---
= Master Keybind Cheat Sheet

Here is a quick reference for your custom keybindings.

#table(
  columns: (1.5fr, 3fr),
  stroke: none,
  align: (left, left),
  
  [*Keybind*], [*Action*],
  [---], [---],
  [`<Space> S`], [Save the current file],
  [`jk` (in Insert mode)], [Quickly escape back to Normal mode],
  [`<Space> cf`], [Copy the entire file to system clipboard],
  [`<Space> y`], [Copy current line to system clipboard],
  [`<Space> p`], [Paste from system clipboard],
  [`Alt + j`], [Move current line (or selection) DOWN],
  [`Alt + k`], [Move current line (or selection) UP],
  [`Ctrl + a` (Insert)], [Jump cursor to the start of the line],
  [`Ctrl + e` (Insert)], [Jump cursor to the end of the line],
  [`<Space> u`], [Open Undotree (View visual undo history)],
)
