
#!/usr/bin/env python
### Random exit for the bash_while input ###
import sys
import random

value=random.randint(0,3)
print("Returning: "+str(value))
sys.exit(value)
