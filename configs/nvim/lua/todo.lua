-- Путь к корню проекта
local project_root = vim.fn.getcwd()

-- Функция для поиска файла TODO.todo
local function find_todo_file()
    local todo_file = project_root .. '/TODO.todo'
    return vim.fn.filereadable(todo_file), todo_file
end

-- Функция для создания файла TODO.todo, если его нет
local function create_todo_file()
    local todo_file = project_root .. '/TODO.todo'
    local file = io.open(todo_file, 'w')
    return todo_file
end

-- Основная функция для использования в командах или автокомандах
function Search_or_create_todo_file()
    local file_exists, todo_file = find_todo_file()
    if not file_exists then todo_file = create_todo_file() end
    vim.cmd('edit ' .. todo_file)
    vim.bo.filetype = 'w0rng_todo'
end

-- Функция для замены квадратных скобок на [x]
function Mark_task_done()
    if vim.bo.filetype ~= 'w0rng_todo' then return end

    local line = vim.fn.getline '.'
    local updated_line = line:gsub('%[ ]', '[x]')

    vim.cmd 'delete'
    vim.fn.append('$', updated_line)

    vim.cmd 'write'
end

-- Создание команды для использования в Neovim
function Insert_new_task()
    if vim.bo.filetype ~= 'w0rng_todo' then return end

    vim.cmd 'normal! o[ ]  ' -- Вставка новой строки с [ ] и переключение в режим вставки
    vim.cmd 'startinsert'
end

vim.api.nvim_set_keymap(
    'n',
    '<CR>',
    ':lua Insert_new_task()<CR>',
    { noremap = true, silent = true }
)

vim.api.nvim_command 'command! TodoFile :lua ()'
vim.api.nvim_set_keymap(
    'n',
    '<leader>yo',
    ':lua Search_or_create_todo_file()<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>yd',
    ':lua Mark_task_done()<CR>',
    { noremap = true, silent = true }
)
