local setup, comment = pcall(require, 'Comment') -- Load the Comment plugin 
if not setup then
  return
end

comment.setup()
