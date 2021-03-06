using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace ACBrFramework.PAF
{
    #region COM_INTEROP

#if COM_INTEROP

    [ComVisible(true)]
    [Guid("CB26F991-CFCD-4928-9E15-D423799CFBC0")]
    [ClassInterface(ClassInterfaceType.AutoDual)]
#endif

    #endregion COM_INTEROP

	public sealed class ACBrPAFRegistrosH2 : ICollection<ACBrPAFRegistroH2>
	{
		#region Fields

		private List<ACBrPAFRegistroH2> list;

		#endregion Fields

		#region Constructor

		internal ACBrPAFRegistrosH2()
		{
			this.list = new List<ACBrPAFRegistroH2>();
		}

		#endregion Constructor

		#region Properties

		public int Count
		{
			get
			{
				return list.Count;
			}
		}

		public bool IsReadOnly
		{
			get
			{
				return false;
			}
		}

		[IndexerName("GetItem")]
		public ACBrPAFRegistroH2 this[int index]
		{
			get
			{
				return list[index];
			}
			set
			{
				list[index] = value;
			}
		}

		#endregion Properties

		#region Methods

		public void Add(ACBrPAFRegistroH2 item)
		{
			list.Add(item);
		}

		public void AddRange(ACBrPAFRegistroH2[] items)
		{
			list.AddRange(items);
		}

		public bool Contains(ACBrPAFRegistroH2 item)
		{
			return list.Contains(item);
		}

		public void CopyTo(ACBrPAFRegistroH2[] array, int arrayIndex)
		{
			list.CopyTo(array, arrayIndex);
		}

		public bool Remove(ACBrPAFRegistroH2 item)
		{
			return list.Remove(item);
		}

		public void Clear()
		{
			list.Clear();
		}

		#endregion Methods

        #region IEnumerable<ACBrPAFRegistroH2>

#if COM_INTEROP
        [DispId(-4)]
        public IDictionaryEnumerator GetEnumerator()
#else
		public IEnumerator GetEnumerator()
#endif
        {
#if COM_INTEROP
            return (IDictionaryEnumerator)(list.GetEnumerator() as IEnumerator);
#else
		    return list.GetEnumerator();
#endif
        }

        IEnumerator<ACBrPAFRegistroH2> IEnumerable<ACBrPAFRegistroH2>.GetEnumerator()
        {
            return list.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return list.GetEnumerator();
        }

        #endregion IEnumerable<ACBrPAFRegistroH2>
	}
}