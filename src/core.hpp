#ifndef __CORE_H__
#define __CORE_H__

#include "assetmanager.hpp"
#include <alchemy/types.hpp>

namespace Engine
{
	class Core
	{
		private:
			Core();

		protected:
			static AssetManager *m_assetmanager;

		public:
			static AssetManager *get_assetmanager();
	};
};

#endif // __CORE_H__