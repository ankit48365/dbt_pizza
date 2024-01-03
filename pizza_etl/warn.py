import warnings

def fxn():
    warnings.warn("deprecated", DeprecationWarning)


# Or if you are using > Python 3.11:
with warnings.catch_warnings(action="ignore"):
    fxn()

# # old python version below
# with warnings.catch_warnings():
#     warnings.simplefilter("ignore")
#     fxn()
