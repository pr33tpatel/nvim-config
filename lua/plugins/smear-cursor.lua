return {
  "sphamba/smear-cursor.nvim",
  opts = {
    smear_between_buffers = true,


    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,

    legacy_computing_symbols_support = false,

    smear_insert_mode = true,
    -- smooth cursor without smear
    stiffness = 0.8,
    trailing_stiffness = 0.49,
    stiffness_insert_mode = 0.6,
    tailing_stiffness_insert_mode = 0.6,
    distance_stop_animating = 0.5,
  },


}
