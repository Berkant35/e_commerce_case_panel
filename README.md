# Atomic Commit Rehberi

Bu projede atomic commit yaklaşımı kullanılmaktadır. Atomic commit, her bir commit'in tek bir değişikliği temsil etmesini sağlayarak kodun daha düzenli, anlaşılır ve geri alınabilir olmasını hedefler. Daha fazla bilgi için: [Atomic Commits Hakkında](https://medium.com/@krystalcampioni/advanced-git-guide-part-1-mastering-atomic-commits-and-enforcing-conventional-commits-1be401467a92)

## Commit Mesajı Formatı

Commit mesajları aşağıdaki yapıya uygun olarak yazılmıştır:

### Türler ve Anlamları

- **feat**: Yeni bir özellik eklendiğini belirtir.
- **fix**: Hata düzeltildiğini belirtir.
- **chore**: Fonksiyonellik içermeyen teknik güncellemeleri belirtir (ör. dokümantasyon, refaktör).

Bu format, commit geçmişinin anlaşılabilir ve izlenebilir olmasını sağlar.

---

## Projede Kullanılan Mimari

Bu projede **Feature-Base Data-Domain-Presentation** yaklaşımı benimsenmiştir. Bu yaklaşım, her bir özelliği katmanlı bir yapı içerisinde modüler olarak düzenler.

### Data-Domain-Presentation Nedir?

Data-Domain-Presentation, projeyi üç ana katmana ayırarak kodun daha okunabilir, test edilebilir ve sürdürülebilir olmasını sağlar:

1. **Data**
   - Veri kaynaklarına erişim (API çağrıları, veri tabanı işlemleri).
   - Veri transfer objeleri (DTO) ve uzantıları içerir.

2. **Domain**
   - İş mantığı ve uygulama kuralları burada yer alır.
   - Use case'ler ve servisler tanımlanır.

3. **Presentation**
   - Kullanıcı arayüzü (UI) bileşenleri ve kullanıcı etkileşimleri (State management).
   - Görsel mantık burada yönetilir.

---
![IMG_1264](https://github.com/user-attachments/assets/a75c7494-f917-41c7-bf51-dad68c5f0474)
![IMG_1265](https://github.com/user-attachments/assets/8936bad9-dac7-46e3-850f-5116e3e2f108)
![IMG_1266](https://github.com/user-attachments/assets/a9731e82-2aa2-490c-b0e9-3837a98a21df)
![IMG_1267](https://github.com/user-attachments/assets/0da81a6b-f99b-4ecc-b938-b854fd697144)
![IMG_1268](https://github.com/user-attachments/assets/9c0aa3ae-0136-460e-9f77-55033210e26e)


