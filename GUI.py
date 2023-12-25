import tkinter as tk
from tkinter import ttk, messagebox
import Randomizer

def submit():
  RandomFifth = random_fifth_var.get()
  MapBased = map_based_var.get()
  selected_map = map_combobox.get()


  if MapBased and selected_map == "":
    messagebox.showerror("Error", "Please select a map!")
    return
  result = Randomizer.randomize(MapBased ,RandomFifth, selected_map )
  result_text = "\n".join(result)
  messagebox.showinfo("Result\n",result_text)




# Create the main window
window = tk.Tk()
window.title("GUI with Checkbuttons and Combobox")

# Checkbuttons for Mode
mode_label = tk.Label(window, text="Select Modes:")
mode_label.pack()

random_fifth_var = tk.BooleanVar()
random_fifth_button = tk.Checkbutton(window, text="Random Fifth", variable=random_fifth_var, onvalue=True, offvalue=False)
random_fifth_button.pack()

map_based_var = tk.BooleanVar()
map_based_button = tk.Checkbutton(window, text="Map Based", variable=map_based_var, onvalue=True, offvalue=False)
map_based_button.pack()

# Combobox for Maps
map_label = tk.Label(window, text="Select Map:")
map_label.pack()

maps = [
    'ascent', 'bind', 'fracture', 'icebox', 'sunset',
    'breeze', 'lotus', 'split', 'haven'
]

map_combobox = ttk.Combobox(window, values=maps)
map_combobox.pack()

# Submit Button
submit_button = tk.Button(window, text="Submit", command=submit)
submit_button.pack(pady=10)

# Run the Tkinter event loop
window.mainloop()




# const smokers = ["Astra",
#   "Brimstone",
#   "Viper",
#   "Harbor",
#   "Omen"]
# const initiators = [
#   "Breach",
#   "Kay0",
#   "Skye",
#   "Sova",
#   "Fade"
# ]
# const sentinels = [
#   "Chamber",
#   "Cypher",
#   "Killjoy",
#   "Sage",
#   "Deadlock"
# ]
# const duelists = [
#   "Jett",
#   "Neon",
#   "Phoenix",
#   "Raze",
#   "Reyna",
#   "Yoru",
#   "Iso"
# ]